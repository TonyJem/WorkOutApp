import UIKit

class StartWorkoutViewController: UIViewController {
    
    var workoutModel = WorkoutModel()
    
    private let workoutParametersView = WorkoutParametersView()
    
    private var numberOfSet = 1
    
    // MARK: - Views
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "START WORKOUT"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let sportmanImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsman")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.layer.cornerRadius = 10
        button.setTitle("FINISH", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .robotoBold16()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(finishButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let detailsLabel = UILabel(text: "Details")
    
    // MARK: - LifeCycle
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    // MARK: - Actions
    @objc private func closeButtonAction() {
        print("🟢 closeButton did Tap in StartWorkoutViewController")
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func finishButtonAction() {
        print("🟢 finishButton did Tap in StartWorkoutViewController")
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateWorkoutModel(model: workoutModel, bool: true)
        } else {
            alertOkCancel(title: "Warning", message: "You haven't finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportmanImageView)
        view.addSubview(detailsLabel)
        
        view.addSubview(finishButton)
    }
}

// MARK: - SetConstraints
extension StartWorkoutViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            sportmanImageView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 20),
            sportmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sportmanImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            sportmanImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: sportmanImageView.bottomAnchor, constant: 20),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
