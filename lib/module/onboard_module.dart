class OnboardItems {
  final String image;
  final String title;
  final String content;
  OnboardItems({
    required this.content,
    required this.image,
    required this.title,
  });
}

List<OnboardItems> onboardItems = [
  OnboardItems(
    content: '''Add,edit,track and admission your drugs in two clicks.Marking a mdeicine from your phone is as easy with the smart watch''',
    image: 'images/heart.png',
    title: 'Reception drug',
  ),OnboardItems(
    title: 'Monitoring health',
    image: 'images/pill.png',
    content: '''View history and your well being after taking drugs in one click''',
  ),OnboardItems(
    title: 'Get notified',
    image: 'images/pills.png',
    content: '''Our system will remind of all the doses of the drug,so you don't have to keep everything in your mind''',
  )
];
