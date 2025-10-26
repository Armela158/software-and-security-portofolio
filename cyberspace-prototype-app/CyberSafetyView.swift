//
//  CyberSafetyView.swift
//  CyberScapeFinal
//
//  Created by Armela Cupi on 26/04/2024.
//

import SwiftUI

struct CyberSafetyView: View {
  
    var body: some View {
        NavigationView {
            List(cyberThreats) { threat in
                VStack(alignment: .leading) {
                    Text(threat.title)
                        .font(.headline)
                        .padding(.vertical, 2)
                    
                    Text(threat.description)
                        .font(.subheadline)
                        .padding(.bottom, 2)
                    
                    Text("Prevention:")
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    Text(threat.preventionTips)
                        .font(.subheadline)
                        .padding(.bottom, 2)
                    
                    // Images are displayed normally without any interactive zooming
                    Image(threat.imageName)
                        .resizable()
                        .scaledToFit()
                }
                .padding()
            }
            .navigationTitle("Cyber Safety Tips")
        }
    }
}

    
    // Array of cyber threats with prevention tips
    private let cyberThreats: [CyberThreat1] = [
        CyberThreat1(
            title: "Phishing Attacks",
            description: "Attackers use fraudulent communication to trick people into revealing sensitive information.",
            preventionTips: "Verify the sender's information. Do not click on suspicious links. Use email filtering and anti-phishing software.",
            imageName: "phishingattackimg"
        ),
        CyberThreat1(
            title: "Malware",
            description: "Malicious software that can damage systems, steal data, and cause havoc.",
            preventionTips: "Install and update antivirus software. Don’t download files from untrusted sources. Keep your operating system updated.",
            imageName: "malwareimg"
        ),
        CyberThreat1(
            title: "Ransomware",
            description: "A type of malicious software that encrypts data and demands a ransom for the decryption key.",
            preventionTips: "Regularly back up data. Educate employees about the risk. Keep all software updated.",
            imageName: "ransomwareimg"
        ),
        CyberThreat1(
            title: "Social Engineering",
            description: "Manipulating people into divulging confidential information or performing actions beneficial to the attacker.",
            preventionTips: "Be skeptical of unsolicited contact. Do not share personal information. Provide employee training on security awareness.",
            imageName: "SocialEngineeringimg"
        ),
        CyberThreat1(
            title: "Denial-of-Service Attacks",
            description: "Attacks intended to shut down a machine or network, making it inaccessible to its intended users.",
            preventionTips: "Invest in infrastructure that can handle spikes in traffic. Use anti-DoS tools and services. Prepare a response plan.",
            imageName: "dosimg"
        ),
        CyberThreat1(
            title: "Man-in-the-Middle Attacks",
            description: "An attacker intercepts communication between two systems to steal data or eavesdrop.",
            preventionTips: "Use encryption on all sensitive data transmissions. Employ VPN services. Avoid public Wi-Fi for confidential transactions.",
            imageName: "mitmimg"
        ),
        CyberThreat1(
            title: "SQL Injection",
            description: "An SQL injection is a type of attack that can give an attacker control over your database.",
            preventionTips: "Use prepared statements and parameterized queries. Validate user input. Regularly update and patch your database systems.",
            imageName: "sqlInjectionimg"
        ),
        CyberThreat1(
            title: "Cross-Site Scripting (XSS)",
            description: "XSS attacks inject malicious scripts into content from trusted websites.",
            preventionTips: "Sanitize and validate all user inputs. Use security policies like Content Security Policy (CSP). Encode data on output.",
            imageName: "cssimg"
        ),
        CyberThreat1(
            title: "Password Attacks",
            description: "Attempts to obtain or decrypt a user's password for illegitimate access.",
            preventionTips: "Use strong, unique passwords for different accounts. Implement multi-factor authentication. Change passwords regularly.",
            imageName: "passwordattackimg"
        ),
        CyberThreat1(
            title: "Advanced Persistent Threats (APT)",
            description: "Prolonged and targeted cyberattacks in which an attacker infiltrates a network to extract valuable information.",
            preventionTips: "Monitor network traffic for unusual activity. Segment networks. Conduct regular security audits and penetration testing.",
            imageName: "aptimg"
        ),
        CyberThreat1(
            title: "Insider Threats",
            description: "Threats posed by individuals from within the organization, such as employees or contractors, who have inside information concerning the organization's security practices.",
            preventionTips: "Enforce the principle of least privilege. Conduct regular audits and monitor user activities. Implement strict access controls and security training.",
            imageName: "insiderthreatimg"
        ),
        CyberThreat1(
            title: "Drive-By Downloads",
            description: "Unintended download of malicious code to your machine, which happens when visiting an infected website.",
            preventionTips: "Keep your software updated. Use reputable antivirus programs. Adjust your browser's security settings to block unauthorized downloads.",
            imageName: "dbdimg"
        ),
        CyberThreat1(
            title: "Adware and Spyware",
            description: "Unwanted software designed to throw advertisements up on your screen, most often within a web browser, or to track your online activities.",
            preventionTips: "Install ad-blockers. Avoid clicking on pop-ups or suspicious advertisements. Use security software that targets adware and spyware.",
            imageName: "ASimg"
        ),
        CyberThreat1(
            title: "IoT Vulnerabilities",
            description: "Security weaknesses associated with IoT devices, which might be exploited to cause harm or steal information.",
            preventionTips: "Change default passwords. Secure your network. Regularly update device firmware. Disconnect devices when not in use.",
            imageName: "IoTVimg"
        ),
        CyberThreat1(
            title: "Deepfakes",
            description: "Synthetic media in which a person in an existing image or video is replaced with someone else's likeness, often used to spread misinformation or create fake identities.",
            preventionTips: "Be critical of unusual requests or messages, even from familiar faces. Use verification techniques for identity confirmation. Stay informed about deepfake technology.",
            imageName: "deepfakesimg"
        ),
        CyberThreat1(
            title: "Cryptojacking",
            description: "The unauthorized use of someone else's computer to mine cryptocurrency.",
            preventionTips: "Use network monitoring tools to watch for suspicious activity. Implement ad-blocking and anti-crypto mining extensions on web browsers.",
            imageName: "cryptojackingimg"
        ),
        CyberThreat1(
            title: "Eavesdropping Attacks",
            description: "Passive attacks where the attacker listens to the unsecured network communication to find sensitive information.",
            preventionTips: "Use encrypted communication protocols such as SSL/TLS. Secure Wi-Fi networks with strong WPA3 encryption.",
            imageName: "eavesdroppingimg"
        ),
        CyberThreat1(
            title: "Rogue Software",
            description: "Malicious software that tricks users into thinking it will help solve a problem, like malware infection, but instead introduces malware to the system.",
            preventionTips: "Only download software from trusted sources. Keep an updated antivirus program. Be wary of software that solicits payment for urgent issues.",
            imageName: "roguesoftwareimg"
        ),
        CyberThreat1(
            title: "Vishing (Voice Phishing)",
            description: "The telephone equivalent of phishing. It is described as the act of using the telephone in an attempt to scam the user into surrendering private information that will be used for identity theft.",
            preventionTips: "Do not divulge personal information over the phone. Verify the caller's identity. Hang up and call the company directly if suspicious.",
            imageName: "vishingimg" // Replace with actual image name
        ),
        CyberThreat1(
            title: "Smishing (SMS Phishing)",
            description: "A form of criminal activity using social engineering techniques similar to phishing. The name is derived from 'SMS phishing'.",
            preventionTips: "Be cautious of SMS messages asking for sensitive information. Don't click on links from unknown senders. Confirm the message's authenticity.",
            imageName: "smishingimg" // Replace with actual image name
        ),
    ]
    
    
    struct CyberSafetyView_Previews: PreviewProvider {
        static var previews: some View {
            CyberSafetyView()
        }
    }
    

