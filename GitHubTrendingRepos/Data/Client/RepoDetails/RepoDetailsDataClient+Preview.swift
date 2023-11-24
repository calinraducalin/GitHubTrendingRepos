//
//  RepoDetailsDataClient+Preview.swift
//  GitHubTrendingRepos
//
//  Created by Calin Radu Calin on 23.11.2023.
//

import Foundation

final class RepoDetailsDataClientPreview: RepoDetailsDataClient, TestDataClient {
    func fetchReadmeContent(repositoryPath: String) async throws -> String {
        return readmeContentPreview
    }
    
}

private let readmeContentPreview = "Learning for Beginners - A Curriculum\n\n> 🌍 Travel around the world as we explore Machine Learning by means of world cultures 🌍\n\nAzure Cloud Advocates at Microsoft are pleased to offer a 12-week, 26-lesson curriculum all about **Machine Learning**. In this curriculum, you will learn about what is sometimes called **classic machine learning**, using primarily Scikit-learn as a library and avoiding deep learning, which is covered in our forthcoming \'AI for Beginners\' curriculum. Pair these lessons with our [\'Data Science for Beginners\' curriculum](https://aka.ms/datascience-beginners), as well!\n\nTravel with us around the world as we apply these classic techniques to data from many areas of the world. Each lesson includes pre- and post-lesson quizzes, written instructions to complete the lesson, a solution, an assignment, and more. Our project-based pedagogy allows you to learn while building, a proven way for new skills to \'stick\'.\n\n**✍️ Hearty thanks to our authors** Jen Looper, Stephen Howell, Francesca Lazzeri, Tomomi Imura, Cassie Breviu, Dmitry Soshnikov, Chris Noring, Anirban Mukherjee, Ornella Altunyan, Ruth Yakubu and Amy Boyd\n\n**🎨 Thanks as well to our illustrators** Tomomi Imura, Dasani Madipalli, and Jen Looper\n\n**🙏 Special thanks 🙏 to our Microsoft Student Ambassador authors, reviewers, and content contributors**, notably Rishit Dagli, Muhammad Sakib Khan Inan, Rohan Raj, Alexandru Petrescu, Abhishek Jaiswal, Nawrin Tabassum, Ioan Samuila, and Snigdha Agarwal\n\n**🤩 Extra gratitude to Microsoft Student Ambassadors Eric Wanjau, Jasleen Sondhi, and Vidushi Gupta for our R lessons!**\n\n---\n\n## Announcement - New Curriculum on Generative AI was just released!\n\nWe just released a 12 lesson curriculum on generative AI. Come learn things like:\n\n- prompting and prompt engineering\n- text and image app generation\n- search apps\n\nAs usual, there\'s a lesson, assignments to complete, knowledge checks and challenges.\n\nCheck it out:\n\n> https://aka.ms/genai-beginners\n\n# Getting Started\n\n**[Students](https://aka.ms/student-page)**, to use this curriculum, fork the entire repo to your own GitHub account and complete the exercises on your own or with a group:\n\n- Start with a pre-lecture quiz.\n- Read the lecture and complete the activities, pausing and reflecting at each knowledge check.\n- Try to create the projects by comprehending the lessons rather than running the solution code; however that code is available in the `/solution` folders in each project-oriented lesson.\n- Take the post-lecture quiz.\n- Complete the challenge.\n- Complete the assignment."
