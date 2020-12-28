
import UIKit

class ViewController: UIViewController {
    
    //Access to questions
    var quizBrain = QuizBrain()

    //Variables to calculate progress bar
    var correctQuestions = 0
    var totalNumberOfQuestions = 1

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Starting Progress Bar to 0%
        totalNumberOfQuestions = quizBrain.getTotalNumberOfQuestions()
        updateUI()
        progressBar.progress = quizBrain.getUserScore(correctQuestions)
    }

    /*
     * This action is triggered by touching either
     * True or False button.
     */
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        /*
            * Store the button the user choosed.
            * Check answer is correct and
            * Check we are not going out of bounds.
            */
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        let quizStillHasQuestions = quizBrain.checkBounds()
        /*
         * Checking if the user answer correctly
         * if correct we will update correct question
         * and update progress bar and display green for correct
         * and red for wrong.
         */
        if(userGotItRight){
            correctQuestions += 1
            progressBar.progress = quizBrain.getUserScore(correctQuestions)
            //Changing color to green when the user got question right
            sender.backgroundColor = UIColor.green
        }else{
            //Changing color to red when the user got question wrong
            sender.backgroundColor = UIColor.red
        }
        
        //Move to next Question
        if(quizStillHasQuestions){
            //Update question value
            quizBrain.moveToNextQuestion()
            
            //This will clear green/red from button.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.updateUI()
            }

        }else{ //RESET QUIZ - restart counters and progress view

            //Use to output users score
            let finalScorePercent = (quizBrain.getUserScore(correctQuestions)) * 100.0
            let finalScoreStr = String(format: "%.2f", finalScorePercent)
            
            //Resettting values
            quizBrain.resetQuestionNumber()
            correctQuestions = 0
            
            //Output users score
            questionLabel.text = "Final Score: " + finalScoreStr + "%"
            
            //After 3 seconds reset progress bar and restart quiz UI
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.progressBar.progress = self.quizBrain.getUserScore(self.correctQuestions)
                self.updateUI()
            }
        }
    }
    
    //This function will change the question and reset button backgrounds
    func updateUI(){
        questionLabel.text = quizBrain.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear

    }
}

