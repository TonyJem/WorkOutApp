import UIKit

protocol SelectCollectionViewItemProtocol: AnyObject {
    func selectItem(date: Date)
}

class CalendarView: UIView {
    
    weak var cellCollectionViewDelegate: SelectCollectionViewItemProtocol?
    
    private let idCalendarCell = "idCalendarCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.backgroundColor = .none
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        return collectionVIew
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
        
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - SetConstraints
extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
}

//MARK: - UICollectionViewDataSource
extension CalendarView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as! CalendarCollectionViewCell
        let dateTimeZone = Date().localDate()
        let weekArray = dateTimeZone.getWeekArray()
        cell.cellConfigure(numberOfDay: weekArray[1][indexPath.item], dayOfWeek: weekArray[0][indexPath.item])
        
        if indexPath.item == 6 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .right)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CalendarView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // TODO: Need to test what is better to use here Date().localDate() or just Date()
        let dateTimeZone = Date().localDate()
        
        switch indexPath.item {
        case 0:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 6))
        case 1:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 5))
        case 2:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 4))
        case 3:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 3))
        case 4:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 2))
        case 5:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 1))
            // TODO: Avoid to use default <--- create enum for all possible cases
        default:
            cellCollectionViewDelegate?.selectItem(date: dateTimeZone.offsetDays(days: 0))
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8,
               height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
