class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'NEVER FORGET YOUR MEDICINE AGAIN!',
      image: 'images/gifs/1.gif',
      description:
          "Remember what to take, Remember when to take, remember when to refill. Never miss a dose again!"),
  UnbordingContent(
      title: 'MULTIPLE USERS, MULTIPLE DEVICES, SAME TIME!',
      image: 'images/gifs/2.gif',
      description:
          "No matter where you are, you can always access your medicine schedule. Sync your medication shedule across all your devices"),
  UnbordingContent(
      title: 'FIND THE BEST AND NEAREST SERVICES!',
      image: 'images/gifs/3.gif',
      description:
          "Find the nearest helpline with ease. Find the nearest hospital and pharmacy. All on your fingertips"),
  UnbordingContent(
      title: 'TRACK EVERYTHING!',
      image: 'images/gifs/4.gif',
      description:
          "Take control of your medication. Never miss a dose again. Stay organized. Stay healthy!"),
];
