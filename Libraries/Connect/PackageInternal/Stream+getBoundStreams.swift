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
            // TODO: no-op for FoundationNetworking, as it does not support this method.
        }
    }
#endif
