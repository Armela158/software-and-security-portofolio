//
//  ContentView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 18/04/2024.
//

// ContentView.swift
// CyberScapeFinal

// ContentView.swift
// CyberScapeFinal

import SwiftUI
import RealityKit

struct ContentView: View {
    @State private var isUserAuthenticated = false
    @State private var shouldShowWelcome = true
    @State private var isOfAge = false
    @State private var showLoginSignupDecision = false
    @State private var showARView = false
    @State private var showQuizPage = false // State to control navigation
    @StateObject var gameCoordinator = GameCoordinator()
    
    var body: some View {
        NavigationView {
            ZStack {
                if shouldShowWelcome {
                    WelcomeView(isUserAuthenticated: $isUserAuthenticated, shouldShowWelcome: $shouldShowWelcome)
                } else if !isUserAuthenticated && !isOfAge {
                    AgeVerificationView(isUserAuthenticated: $isUserAuthenticated, showLoginSignupDecision: $isOfAge)
                } else if !isUserAuthenticated && isOfAge {
                    LoginSignupDecisionView(isUserAuthenticated: $isUserAuthenticated, showLoginSignupDecision: $showLoginSignupDecision)
                } else if isUserAuthenticated && !showARView {
                    HomePageView(isUserAuthenticated: $isUserAuthenticated, showARView: $showARView)
                } else if showARView {
                    ARViewContainer(gameCoordinator: gameCoordinator, showQuiz: $showQuizPage) // Pass the binding to showQuiz
                        .overlay(
                            VStack {
                                HStack {
                                    backButton
                                    Spacer()
                                    quizButton
                                }
                                Spacer()
                            },
                            alignment: .top
                        )
                }

                // NavigationLink to present QuizView when showQuizPage is true
                NavigationLink(destination: QuizView(questions: sampleQuestions, showQuiz: $showQuizPage), isActive: $showQuizPage) {
                    EmptyView() // This is a placeholder for the NavigationLink
                }
            }
            .onChange(of: isUserAuthenticated) { newValue in
                shouldShowWelcome = !newValue
            }
            .onChange(of: isOfAge) { newValue in
                showLoginSignupDecision = newValue
            }
        }
    }
    
    var backButton: some View {
        Button(action: {
            self.showARView = false
        }) {
            Image(systemName: "arrow.backward.circle.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .clipShape(Circle())
        }
        .padding()
        .accessibilityLabel("Back")
    }
    
    var quizButton: some View {
        Button(action: {
            self.showQuizPage = true // This will trigger the navigation
        }) {
            Image(systemName: "questionmark.circle.fill")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue.opacity(0.7))
                .clipShape(Circle())
        }
        .padding()
        .accessibilityLabel("Quiz")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


let sampleQuestions = [
            //Zero-Day Exploit
                    QuizQuestion(question: "What is a Zero-Day Exploit?",
                                 options: ["A) An unpatched software flaw", "B) A strong password", "C) A backup recovery plan", "D) An antivirus software"],
                                 correctAnswer: "An unpatched software flaw",
                                 imageName: "Zero-Day Exploits"),
                    
                    // Advanced Persistent Threats
                            QuizQuestion(question: "What is an Advanced Persistent Threat (APT)?",
                                options: ["A short-term hacking event", "An ongoing network attack", "A quick malware insertion", "An antivirus update"],
                                correctAnswer: "An ongoing network attack",
                                imageName: "AdvancedPersistentThreat"),
                    
                            QuizQuestion(question: "Which of the following best describes APT?",
                                 options: ["A quick, automated attack", "A long-term, targeted attack", "A repeated brute force attack", "A one-time phishing attempt"],
                                 correctAnswer: "A long-term, targeted attack",
                                 imageName: "AdvancedPersistentThreat"),
                    
                    // Cross-Site Scripting
                            QuizQuestion(question: "What does Cross-Site Scripting (XSS) attack do?",
                                options: ["Steals user data", "Defaces websites", "Encrypts files for ransom", "Slows down the network"],
                                correctAnswer: "Steals user data",
                                imageName: "Cross-SiteScripting"),
                    
                            QuizQuestion(question: "Which is a common prevention method against XSS attacks?",
                                 options: ["User account lockout", "Input validation", "Data encryption", "Frequent password changes"],
                                 correctAnswer: "Input validation",
                                 imageName: "Cross-SiteScripting"),
                    
                    // Data Breaches
                            QuizQuestion(question: "What typically causes a data breach?",
                                options: ["Outdated software", "Physical break-in", "Strong passwords", "Data encryption"],
                                correctAnswer: "Outdated software",
                                imageName: "DataBreaches"),
                    
                    QuizQuestion(question: "What is often a first sign of a data breach?",
                                 options: ["Unusual network activity", "Increased email spam", "Faster computer performance", "New software installation"],
                                 correctAnswer: "Unusual network activity",
                                 imageName: "DataBreaches"),
                    
                    // Denial-of-Service
                            QuizQuestion(question: "A Denial-of-Service attack is intended to:",
                                options: ["Steal information", "Interrupt service availability", "Send spam emails", "Encrypt data"],
                                correctAnswer: "Interrupt service availability",
                                imageName: "Denial-of-Service"),
                    
                            QuizQuestion(question: "A distributed Denial-of-Service (DDoS) attack:",
                                 options: ["Targets a single computer", "Is easier to mitigate than DoS", "Comes from multiple compromised systems", "Only affects web servers"],
                                 correctAnswer: "Comes from multiple compromised systems",
                                 imageName: "Denial-of-Service"),
                    
                    // Malware Attack
                            QuizQuestion(question: "Which action can help prevent a malware attack?",
                                 options: ["Leaving the default router password", "Opening email attachments from unknown senders", "Downloading software from official sources", "Ignoring software updates"],
                                 correctAnswer: "Downloading software from official sources",
                                 imageName: "MalwareAttack"),
                    
                            QuizQuestion(question: "Which of these is considered malware?",
                                options: ["Firewall", "Virus", "Data backup", "Web browser"],
                                correctAnswer: "Virus",
                                imageName: "MalwareAttack"),
                    
                    //Insider Threat
                    QuizQuestion(question: "What is an insider threat?",
                        options: ["A hacker from another country", "An employee who unintentionally compromises security", "A disgruntled employee who intentionally steals information", "A new type of malware"],
                        correctAnswer: "A disgruntled employee who intentionally steals information",
                        imageName: "InsiderThreats"),
                    
                    QuizQuestion(question: "How can companies mitigate insider threats?",
                        options: ["By installing antivirus software", "By implementing strict access controls and monitoring systems", " By ignoring them", "By outsourcing IT services"],
                        correctAnswer: "By implementing strict access controls and monitoring systems",
                        imageName: "InsiderThreats"),
                    
                    //IoT Vulnerabilities
                    QuizQuestion(question: "What makes IoT devices vulnerable?",
                        options: ["Their ability to connect to the internet", "Weak authentication protocols", "They are usually well secured", "Their color and design"],
                        correctAnswer: "Weak authentication protocols",
                        imageName: "IoTVulnerabilities"),
                    
                    QuizQuestion(question: "Which of the following is a common security measure for IoT devices?",
                        options: ["Using default passwords", "Disconnecting them from the internet", "Regular firmware updates", "Using them only during the day"],
                        correctAnswer: "Regular firmware updates",
                        imageName: "IoTVulnerabilities"),
                    
                    //Man-In-The-Middle
                    
                    QuizQuestion(question: "What is a Man-in-the-Middle attack?",
                        options: ["When an attacker physically assaults the victim", "When an attacker intercepts communication between two parties", "When malware is installed on a device", "When a user clicks on a phishing link"],
                        correctAnswer: "When an attacker intercepts communication between two parties",
                        imageName: "Man-in-the-Middle"),
                    
                    QuizQuestion(question: "How can you prevent Man-in-the-Middle attacks?",
                        options: ["By shutting down the computer", "By avoiding all communication", "Using HTTPS for secure communications", "By using simple passwords"],
                        correctAnswer: "Using HTTPS for secure communications",
                        imageName: "Man-in-the-Middle"),
                    
                    //Mobile Security Threats
                    
                    QuizQuestion(question: "What is a common mobile security threat?",
                        options: ["Opening the device too often", "Installing apps from untrusted sources", "Not using a mobile case", "Overcharging the battery"],
                        correctAnswer: "Installing apps from untrusted sources",
                        imageName: "MobileSecurityThreats"),
                    
                    QuizQuestion(question: "Which of these is an effective mobile security practice?",
                        options: ["Keeping Bluetooth on at all times", "Using simple swipe patterns", "Never updating the OS", "Installing security updates promptly"],
                        correctAnswer: "Installing security updates promptly",
                        imageName: "MobileSecurityThreats"),
                    
                    //Password Attacks
                    QuizQuestion(question: "What is a brute force password attack?",
                        options: ["Writing down passwords", "Forgetting passwords", "Trying many password combinations until the right one is found", "Using one password for multiple accounts"],
                        correctAnswer: "Trying many password combinations until the right one is found",
                        imageName: "PasswordAttacks"),
                    
                    QuizQuestion(question: "How can you protect against password attacks?",
                        options: ["Using your name as the password", "Creating long, complex passwords", "Using passwords like '123456'", "Sharing passwords with friends for safekeeping"],
                        correctAnswer: "Creating long, complex passwords",
                        imageName: "PasswordAttacks"),
                    
                    //Phishing Attack
                    
                    QuizQuestion(question: "What is phishing?",
                        options: [" A type of computer game", "A fraudulent attempt to obtain sensitive information by pretending to be a trustworthy entity", "Sending emails about fishes", "A technique to increase internet speed"],
                        correctAnswer: "A fraudulent attempt to obtain sensitive information by pretending to be a trustworthy entity",
                        imageName: "phishingattack"),
                    
                    QuizQuestion(question: "What is a sign of a phishing email?",
                        options: ["It is sent from a known colleague", "It offers free candy", "It is well written with no typos", "It requests sensitive information like passwords"],
                        correctAnswer: "It requests sensitive information like passwords",
                        imageName: "phishingattack"),
                    
                    //Ransomware
                    QuizQuestion(question: "What is ransomware?",
                        options: ["Software that demands payment to unlock your device", "Malware that encrypts files and demands ransom for the decryption key", "A new operating system", "An antivirus program"],
                        correctAnswer: "Malware that encrypts files and demands ransom for the decryption key",
                        imageName: "Ransomware"),
                    
                    QuizQuestion(question: "How to prevent ransomware attacks?",
                        options: ["By paying the ransom", "Using older software versions", "Regularly backing up data and using reputable antivirus software", "Clicking on pop-up advertisements"],
                        correctAnswer: "Regularly backing up data and using reputable antivirus software",
                        imageName: "Ransomware"),
                    
                    //Social Engineering
                    QuizQuestion(question: "What is social engineering in the context of cybersecurity?",
                        options: ["Manipulating people into giving up confidential information", "The study of social behavior", "Building social media applications", "Engineering social events for team building"],
                        correctAnswer: "Manipulating people into giving up confidential information",
                        imageName: "SocialEngineering"),
                    
                    QuizQuestion(question: "How can social engineering be countered?",
                        options: ["By isolating employees", "Through security awareness training", "By banning social media", "By trusting all emails and callers"],
                        correctAnswer: "Through security awareness training",
                        imageName: "SocialEngineering"),
];

