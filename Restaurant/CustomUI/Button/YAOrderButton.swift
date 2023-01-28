import UIKit

class YAOrderButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        configue()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title : String){
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configue(){
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        clipsToBounds = true
        layer.cornerRadius = 18
        
    }
    
}
