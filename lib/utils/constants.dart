class Constants {
  static const valueEmpty = '';
  static const maxTweetCharacters = 280;
}

class ConstantText {
  static const buttonCreateTweet = 'Create';
  static const buttonLogin = 'Login';
  static const buttonRegisterAndLogin = 'Register & Login';
  static const buttonEditSaveTweet = 'Save';
  static const menuEdit = 'Edit';
  static const menuDelete = 'Delete';
  static const dialogTweetDeleteTitle = 'Delete tweet';
  static const dialogTweetDeleteMessage = 'Do you confirm deleting this tweet?';
  static const dialogTweetDeleteOptionConfirm = 'Confirm';
  static const dialogTweetDeleteOptionCancel = 'Cancel';
  static const titleTweets = 'Tweets';
}

class ConstantRoute {
  static const root = '/';
  static const tweets = '/tweets';
  static const tweetManage = '/tweet/manage';
}

class ConstantFirestore {
  static const collectionTweets = 'tweets';
  static const jsonKeyId = 'id';
  static const jsonKeyCreatedAt = 'createdAt';
}
