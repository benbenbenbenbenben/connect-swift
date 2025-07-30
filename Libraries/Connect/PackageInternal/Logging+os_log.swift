#if !canImport(os.Log)
    import Logging
    let logger = Logger(label: "com.example.connect")
    func os_log(
        _ level: Logger.Level,
        _ message: String,
        _ args: CVarArg...
    ) {
        // format the message with the provided arguments
        let formattedMessage = String(format: message, arguments: args)
        // log the message using the logger
        logger.log(level: level, "\(formattedMessage)")
    }

    extension Logger.Level {
        static let fault = Logger.Level.error
        static let debug = Logger.Level.info
    }
#endif
