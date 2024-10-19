import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "com.methodchaneltask.machine_test/login",
                                           binaryMessenger: controller.binaryMessenger)

        channel.setMethodCallHandler { (call, result) in
            if call.method == "login" {
                if let args = call.arguments as? [String: Any],
                   let email = args["email"] as? String,
                   let password = args["password"] as? String,
                   let deviceToken = args["device_token"] as? String,
                   let deviceType = args["device_type"] as? String {
                    
                    self.login(email: email, password: password, deviceToken: deviceToken, deviceType: deviceType, result: result)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid arguments", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func login(email: String, password: String, deviceToken: String, deviceType: String, result: @escaping FlutterResult) {
        guard let url = URL(string: "https://scratchy.esferasoft.in/api/login") else {
            result(FlutterError(code: "INVALID_URL", message: "Invalid URL", details: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let json: [String: Any] = [
            "email": email,
            "password": password,
            "device_token": deviceToken,
            "device_type": deviceType
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: json)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                result(FlutterError(code: "NETWORK_ERROR", message: error.localizedDescription, details: nil))
                return
            }
            guard let data = data else {
                result(FlutterError(code: "DATA_ERROR", message: "No data returned", details: nil))
                return
            }

            let responseString = String(data: data, encoding: .utf8)
            result(responseString)
        }

        task.resume()
    }
}
