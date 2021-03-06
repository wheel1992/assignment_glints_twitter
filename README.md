
# Assignment Glints Twitter

<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/demo-location.gif" height="400"/>

## 1. Introduction

Assignment based on [1-Person Twitter App](https://gist.github.com/seahyc/a937011e576bc32fe1b54ea8ab8cf52f).

Created By [Joseph](https://www.linkedin.com/in/joseph-cheng-90581a40/).
- Head of Mobile @ Shopform Singapore
  - Febuary 2020 till current
- ex Software Enginner @ Singapore SME Handshakes
  - April 2020 to December 2020
ex Flutter Engineer x Product Owner @ Hmlet Singapore
  - July 2019 to March 2020

## 2. Getting Started
1. Open project folder in VsCode or any other IDEs.
2. In terminal, run the following command
```
> flutter pub get
> flutter run -d <device_id|emulator_id>
```

3. To login, please use the following credential 

|Usename|Password|
|---|---|
|`hello@glints.com`|`123456`|

---

## 3. In-depth Analysis

### 3.1. App Screenshoots

|Screens|Explaination|
|---|---|
|<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/1-login.png" alt="drawing" height="400"/>|**Login Screen**<br/>- Login using Firebase auth.<br/>- Either login or register with new credential|
|<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/2-tweets.png" alt="drawing" height="400"/>|**Tweets Screen**<br/>- List down all tweets that are stored in Firestore|
|<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/3-create-tweet.png" alt="drawing" height="400"/>|**Create a Tweet Screen**<br/>- Maximum of 280 characters.<br>- If user enters more than 280 (copy/paste), 281th character onwards will be discarded|
|<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/4-edit-tweet.png" alt="drawing" height="400"/>|**Edit a Tweet Screen**<br/>- Updated date time will be updated in Firestore document|
|<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/5-delete-tweet.png" alt="drawing" height="400"/>|**Delete a Tweet Screen**<br/>- The document by document id will be removed from Firestore.|

### 3.2. Firestore Screenshoots

<img src="https://github.com/wheel1992/assignment_glints_twitter/blob/main/screenshoots/6-firestore.png" height="400"/>

In firestore, a collection `tweets` contains multiple documents.

Each document has an unique auto generated id and contain the following parameters.

|Key|Type|Description|
|---|---|---|
|`id`|string|The auto generated id by `Firestore`|
|`content`|string|The 280 character of tweet message|
|`createdAt`|number|UTC millisecond since epoch.<br/>When tweet is first created, value will be created|
|`createdBy`|string|`Firebase` authenticated user's uid|
|`updatedAt`|number|UTC millisecond since epoch.<br/>When tweet is edited and saved, this value will be created|

---

## 4. Improvements

1. Display loading indicator during data retrieval
2. Add taggings by username and hashtags
3. Add search for tweets based on username, tagged user and hashtags
4. Improve UX
5. Integate CI/CD with Codemagic / Bitrise
