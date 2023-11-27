Hi 👋.

**GitHubTrendingRepos** is a demo app that displays the daily/weekly/monthly trending repositories on GitHub. The details page shows the readme file using an external package. Because the figma page appeared to have only one variant which looks between light and dark, I disabled light/dark support for the app and kept the color theme on the entire app. I only added a few unit tests for demo purposes.

I tried to write simple and modern code taking in consideration the following aspects:
- use ****MVVM architecure**** for decoupling the main views logic
- use ***async/await*** pattern everywhere for asynchronous code
- the ***DataClient*** responsible for API access is just an extension over ***URLSession***
- ***protocols*** are used for limiting code access and enabling code testability
- code reuse was done with the help of ***protocol extensions***
- support previews for every view for faster UI implementation

I have another demo app implemented in SwiftUI that caches the data using **CoreData**. I would love if you could check this project too because it is a bit more complex: https://github.com/calinraducalin/ComgyCodeChallenge


**Some notes for the reviewer(s) 📝** 

I spent some time trying to find a working GitHub Trending API and eventually I found [one working](https://github.com/alisoft/github-trending-api) which was a fork of a main [discontinued project](https://github.com/huchenme/github-trending-api). The alternative would have been to use the GitHub Rest API but that one exposes only some search repository API with stars ordering and the results were not the actual trending repositories.

Also, I did put a lot of effort into creating the xapo logo because I couldn't export the one from figma in one file as I had only read access and couldn't group the layers. I ended up manipulating [this vector image](https://seeklogo.com/vector-logo/424775/xapo-wallet) by removing the text path from the svg file and then converting it into a PDF file. Or maybe you were expecting to ask for write access? I'm interested in your thoughts. 🤔

I am not sure if these were part of the challenge but I thought it's worth mentioning.

Thank you for reviewing my demo project(s)! 🙏
