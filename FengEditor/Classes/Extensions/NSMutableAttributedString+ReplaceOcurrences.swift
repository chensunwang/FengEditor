import Foundation

extension NSMutableAttributedString {

    /// Replaces all ocurrences of `stringToFind` with `replacementString` in the receiver.
    ///
    /// - Parameters:
    ///     - stringToFind: the string to replace.
    ///     - replacementString: the string to replace all matching occurrences with.
    ///
    func replaceOcurrences(of stringToFind: String, with replacementString: String) {

        assert(!replacementString.contains(stringToFind),
               "Allowing the replacement string to contain the original string would result in a ininite loop.")

        while let range = string.range(of: stringToFind) {
            let nsRange = string.utf16NSRange(from: range)

            replaceCharacters(in: nsRange, with: replacementString)
        }
    }

    /// Replaces all ocurrences of `stringToFind` with `replacementString` in the receiver.
    ///
    /// - Parameters:
    ///     - stringToFind: the string to replace.
    ///     - replacementString: the string to replace all matching occurrences with.
    ///
    /// - Returns: the provided range after replacing the occurrences.
    ///
    func replaceOcurrences(of stringToFind: String, with replacementString: String, within range: NSRange) {

        assert(!replacementString.contains(stringToFind),
               "Allowing the replacement string to contain the original string would result in a ininite loop.")

        let swiftUTF16Range = string.utf16.range(from: range)
        guard var swiftRange = string.range(from: swiftUTF16Range) else {
            assertionFailure("swiftRange is not supposed to be nil")
            return
        }

        while let matchRange = string.range(of: stringToFind, options: [], range: swiftRange, locale: nil) {
            let matchNSRange = string.utf16NSRange(from: matchRange)

            replaceCharacters(in: matchNSRange, with: replacementString)

            // Since the new string may invalidate the initial swift range, we want to update it.
            swiftRange = swiftRange.lowerBound ..< string.index(matchRange.lowerBound, offsetBy: replacementString.count)
        }
    }
}
