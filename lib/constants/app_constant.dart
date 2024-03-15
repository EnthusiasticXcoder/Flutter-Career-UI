class AppConstants {
  /// URL Paths of the API Endpoints
  static const baseURL = 'django-carrier-api.vercel.app';
  static const registerPath = 'user/register';
  static const loginPath = 'user/login';
  static const userPath = 'user';
  static const currierlistPath = 'blog/menu';
  static const bloglistPath = 'blog/list';
  static const blogContantPath = 'blog/content';

  static const roadmapPath = 'https://roadmap.sh';
  static const youtubePath = 'https://www.youtube.com/';
  static const chatBotImageURL =
      'https://media.istockphoto.com/id/1073043572/vector/robot-icon-bot-sign-design-chatbot-symbol-concept-voice-support-service-bot-online-support.jpg?s=612x612&w=0&k=20&c=IpqF1oBpILXVKmCPj63IftCxgDzNcTe7bvWnd-wSapw=';

  static const payloadField = 'payload';
  static const tokenfield = 'token';
  static const firstNameField = 'first_name';
  static const lastNameField = 'last_name';
  static const emailField = 'email';
  static const userNameField = 'username';
  static const passwordField = 'password';
  static const confirmPassword = 'Confirm Password';
  static const authorization = 'Authorization';

  static const tagField = 'tag';
  static const contentField = 'content';
  static const linkField = 'link';
  static const imgField = 'img';
  static const catagoryField = 'catagory';
  static const catagoryLinkField = 'catagorylink';
  static const title = 'title';
  static const text = 'text';
  static const blogField = 'blog';
  static const attributeListField = 'attlist';
  static const url = 'url';
  static const appFont = 'Sen';
  static const career = 'Careers';
  static String getAuthorizationValue(String? token) => 'token $token';
}
