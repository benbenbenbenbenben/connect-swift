import Foundation

#if canImport(FoundationNetworking)
    import FoundationNetworking

    extension Foundation.Stream {
        /// Returns a pair of bound streams with the specified buffer size.
        ///
        /// - Parameters:
        ///   - withBufferSize: The size of the buffer for the streams.
        ///   - inputStream: A reference to the input stream.
        ///   - outputStream: A reference to the output stream.
        public static func getBoundStreams(
            withBufferSize bufferSize: Int,
            inputStream: inout InputStream?,
            outputStream: inout OutputStream?
        ) {
            // Linux implementation using POSIX pipe
            var fds: [Int32] = [0, 0]
            guard pipe(&fds) == 0 else {
                inputStream = nil
                outputStream = nil
                return
            }
            // Buffer size logic omitted for portability.
            let inPath = "/dev/fd/\(fds[0])"
            let outPath = "/dev/fd/\(fds[1])"
            inputStream = InputStream(fileAtPath: inPath)
            outputStream = OutputStream(toFileAtPath: outPath, append: false)
            if inputStream == nil { inputStream = nil }
            if outputStream == nil { outputStream = nil }
        }
    }
#endif
