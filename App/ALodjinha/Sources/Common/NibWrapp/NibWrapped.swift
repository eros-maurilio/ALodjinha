import UIKit

@propertyWrapper public struct NibWrapped<T: UIView> {
    
    public init(_ : T.Type) { }
    
    public var wrappedValue: UIView!
    
    public var unwrapped: T { (wrappedValue as! NibWrapperView<T>).contentView }
    
}
