import Foundation

class NotificationActionService {

    let NOTIFICATION_ACTION_CHANNEL = "de.lukasreining.handball_ergebnisse/notifications_action"
    let TRIGGER_ACTION = "triggerAction"
    let GET_LAUNCH_ACTION = "getLaunchAction"

    private let notificationActionChannel: FlutterMethodChannel

    var launchAction: String? = nil

    init(withBinaryMessenger binaryMessenger: FlutterBinaryMessenger) {
        notificationActionChannel = FlutterMethodChannel(name: NOTIFICATION_ACTION_CHANNEL, binaryMessenger: binaryMessenger)
        notificationActionChannel.setMethodCallHandler(handleNotificationActionCall)
    }

    func triggerAction(action: String) {
       notificationActionChannel.invokeMethod(TRIGGER_ACTION, arguments: action)
    }

    private func handleNotificationActionCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case GET_LAUNCH_ACTION:
            result(launchAction)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
