#if os(iOS) || os(visionOS)

import UIKit

public final class SlideDownSegue: UIStoryboardSegue {}
public final class ValidatePasswordViewController: UIViewController {}

#elseif os(macOS)

import Cocoa

public final class LoginSegue: NSStoryboardSegue {}
public final class LoginViewController: NSWindowController {}

#endif

import Foundation

public final class CustomArray: NSArray {}
