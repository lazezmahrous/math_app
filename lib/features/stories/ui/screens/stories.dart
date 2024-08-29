import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/features/stories/data/models/story_model.dart';
import 'package:math_app/features/stories/logic/providers/story_provider.dart';
import 'package:math_app/features/stories/ui/widgets/story_card_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_appbar.dart';
import '../../../../core/widgets/app_back_button.dart';

class Stories extends StatelessWidget {
  Stories({super.key});

  List<Story> storiesForSubtraction = [
    Story(
      title: 'الأرنب لولو',
      description:
          'في يوم من الأيام، كان هناك أرنب صغير اسمه "لولو". لولو كان يحب قضاء الوقت في الحقل المليء بالزهور والفواكه. كان لولو ذكيًا ويحب تعلم أشياء جديدة كل يوم. في أحد الأيام، بينما كان لولو يتجول في الحقل، وجد 10 جزر كبيرة وبرتقالية اللون. لولو جمع الجزر ووضعها في حقيبته الصغيرة. بينما كان يواصل جولته، التقى بصديقه العصفور "توكي". توكي كان يبدو حزينًا بعض الشيء. لولو سأل توكي: "ما الذي يزعجك يا توكي؟" توكي أجاب: "كنت أجمع الجزر لأمي، ولكنني فقدت 3 جزر بسبب الرياح القوية." لولو فكر للحظة وقال: "لا تقلق يا توكي، أنا لدي 10 جزر في حقيبتي. إذا أعطيتك 3 منها، كم سيتبقى لديّ؟" توكي نظر إلى لولو بتفكير وقال: "إذا أعطيتني 3 جزر من 10، فكم جزرة ستبقى لديك؟" لولو بدأ يفكر ويحسب وقال: "10 - 3 = 7. يعني سيتبقى لديّ 7 جزر!" توكي ابتسم وقال: "أنت محق يا لولو! والآن يمكننا مشاركة الجزر معًا." لولو أعطى توكي 3 جزر، وأخذ معه 7 جزر. جلسوا معًا تحت شجرة ظليلة وأكلوا الجزر اللذيذ. ومنذ ذلك اليوم، تعلم لولو وتوكي أن الطرح يمكن أن يساعدهم على حساب ما يتبقى من الأشياء، وأن المشاركة هي سر السعادة بين الأصدقاء.',
      soundName: 'rabit_lolo.mp3',
      imageName: 'rabit_lolo.png',
      videoLink: 'https://www.youtube.com/watch?v=pAO6QuXCjBI',
    ),
    Story(
      title: 'الدب بونبو وتوته',
      description:
          'في يوم من الأيام، كان هناك دب صغير اسمه "بومبو". بومبو كان يحب اللعب في الغابة والتجول بين الأشجار. في أحد الأيام، بينما كان بومبو يلعب بالقرب من نهر، عثر على مجموعة من الفواكه اللذيذة. بومبو جمع 9 تفاحات وضعها في سلة صغيرة. في نفس الوقت، كانت صديقته السلحفاة "توتة" تمر بجانب النهر وتبدو حزينة. بومبو ذهب إليها وسألها: "ما بكِ يا توتة؟ لماذا أنت حزينة؟" توتة أجابت: "كنت أحاول جمع الفواكه لصنع عصير، لكنني فقدت 5 تفاحات من سلتها بسبب الرياح." بومبو فكر قليلاً ثم قال: "لا داعي للحزن يا توتة، أنا لدي 9 تفاحات! إذا فقدت 5 منها، كم سيتبقى لديّ؟" توتة نظرت إلى بومبو وقالت: "إذا كنت قد فقدت 5 تفاحات من 9، فكم تفاحة ستبقى لديك؟" بومبو بدأ يحسب في ذهنه وقال: "9 - 5 = 4. يعني سيتبقى لديّ 4 تفاحات!" توتة ابتسمت وقالت: "بالضبط يا بومبو! الآن يمكنك أن تعطيني بعض التفاحات لنصنع العصير معاً." بومبو وتوتة جمعوا التفاحات المتبقية وصنعوا عصير التفاح اللذيذ معاً. قضوا وقتاً ممتعاً في العمل سوياً واستمتعوا بالعصير. ومنذ ذلك اليوم، تعلم بومبو وتوتة أن الطرح هو وسيلة مفيدة لمعرفة كم يتبقى من الأشياء ومشاركة المتعة مع الأصدقاء.',
      soundName: 'bear_and_cat.mp3',
      imageName: 'bear_and_cat.png',
      videoLink: 'https://www.youtube.com/watch?v=pAO6QuXCjBI',
    ),
  ];

  List<Story> storiesForAddition = [
    Story(
      title: 'فلفول الأرنب وسلمون السلحفاة',
      description:
          'في يوم من الأيام، كان فيه أرنب اسمه "فلفل"، فلفل كان عايش في غابة مليانة خضار وفاكهة لذيذة. فلفل كان بيحب جِزَر جدًا، وكان بيجمع جِزَر كل يوم قبل ما يرجع لبيته. في يوم، وهو راجع على بيته، لقى صديقه السلحفاة "سلوم" واقف جنب الطريق وحزين. فلفل سأله: "مالك يا سلوم؟ ليه زعلان؟" سلوم رد عليه: "أنا كنت بحاول أجمع جِزَر زيك، لكن لقيت بس 2 جِزَر، ومحتاج 3 جِزَر كمان عشان أعمل الشوربة اللي بحبها." فلفل ضحك وقال له: "ما تقلقش يا سلوم، أنا عندي 3 جِزَر! لو ضفناهم للجِزَر بتاعك هيبقى عندنا كام جِزَر؟" سلوم فكر شوية وقال: "أنت عندك 3 جِزَر، وأنا عندي 2 جِزَر، لو ضفناهم لبعض يبقى عندنا 5 جِزَر!" فلفل ضحك وقال له: "بالضبط يا سلوم! دلوقتي نقدر نعمل الشوربة اللي بتحبها!" وبكده، فلفل وسلوم ضافوا الجِزَر مع بعض وعملوا أحلى شوربة جزر في الغابة، وقعدو يضحكوا ويأكلوا مع بعض. ومن يومها، فلفل وسلوم اتعلموا إن الجمع هو طريقة رائعة لمشاركة الأشياء وتكوين صداقات جديدة!',
      soundName: 'firist_story_felfel.mp3',
      imageName: 'turtle_and_rabit.png',
      videoLink: 'https://www.youtube.com/watch?v=pAO6QuXCjBI',
    ),
    Story(
      title: 'قطة صغيرة اسمها لوزة',
      description:
          'في يوم من الأيام، كان فيه قطة صغيرة اسمها "لوزة"، لوزة كانت بتحب تلعب بكرات الصوف الملونة. في يوم وهي بتلعب في الحديقة، لقت كرة صوف حمراء، ولونها كان جميل جدًا، فحبتها جدًا وخدتها تلعب بيها. بعد شوية، جت صاحبتها العصفورة "رفرفة" وقالت لها: "يا لوزة، أنا لقيت كرة صوف زرقاء، بتحبي تلعب معايا؟" لوزة قالت: "طبعًا يا رفرفة! دلوقتي عندي كرة صوف حمراء، وإنتي عندك كرة صوف زرقاء. لو لعبنا بيهم مع بعض، هيبقى عندنا كام كرة صوف؟" رفرفة فكرت وقالت: "إنتي عندك كرة واحدة، وأنا عندي كرة واحدة، يبقى عندنا كرتين!" لوزة فرحت وقالت: "صح يا رفرفة! دلوقتي نقدر نلعب بكرتين ونقضي وقت ممتع مع بعض!" ومن يومها، لوزة ورفرفة اتعلموا إن الجمع بيخلينا نلعب بألعاب أكتر ونستمتع أكتر مع بعض!',
      soundName: 'loaz_story.mp3',
      imageName: 'small_cat.png',
      videoLink: 'https://www.youtube.com/watch?v=pAO6QuXCjBI',
    ),
    Story(
      title: 'تووت وسامي في الحديقة',
      description:
          'في يوم من الأيام، كان فيه طائر صغير اسمه "تووت"، وكان تووت يحب اللعب في الحديقة الخضراء. كل يوم، كان يجمع بذور الفاكهة ويضعها في عشه الصغير. في يوم من الأيام، وهو يلعب في الحديقة، لقى صديقه السنجاب "سامي" واقف جنب شجرة ويبدو عليه الحزن. تووت طار بسرعة وسأل سامي: "مالك يا سامي؟ ليه زعلان؟" سامي رد عليه: "كنت بحاول أجمع مكسرات لتناول وجبة لذيذة، لكنني وجدت فقط 4 مكسرات، وأنا بحاجة إلى 3 مكسرات إضافية." تووت فكر قليلاً وقال: "لا تحزن يا سامي، أنا عندي 3 مكسرات! لو ضفناهم مع مكسراتك، كم مكسرات هيكون عندنا؟" سامي تذكر المكسرات وقال: "أنت عندك 3 مكسرات، وأنا عندي 4 مكسرات، لو ضفناهم معاً، هيكون عندنا 7 مكسرات!" تووت طار فرحاً وقال: "بالضبط يا سامي! الآن يمكننا أن نحتفل بوجبة مكسرات لذيذة معاً!" وهكذا، تووت وسامي جمّعوا المكسرات وأعدوا وجبة لذيذة، واحتفلوا بلعبهم ومشاركتهم. ومن ذلك اليوم، تعلم تووت وسامي أن الجمع هو طريقة رائعة لمشاركة الأشياء والاستمتاع مع الأصدقاء.',
      soundName: 'toot_and_samy.mp3',
      imageName: 'tot_and_samy.png',
      videoLink: 'https://www.youtube.com/watch?v=pAO6QuXCjBI',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Stories to teach addition (+): ',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
          ),
          verticalSpace(10),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            shrinkWrap: true,
            itemCount: storiesForAddition.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Provider.of<StoryProvider>(context, listen: false)
                    .getStory(storiesForAddition[index]);
                context.pushNamed(Routes.readingStory);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: StoryCardWidget(
                  colors: [
                    ColorsManager.secondBlueColor,
                    ColorsManager.mainBlue
                  ],
                  story: storiesForAddition[index],
                ),
              ),
            ),
          ),
          verticalSpace(30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Stories to teach Subtraction (-): ',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
          ),
          verticalSpace(10),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            shrinkWrap: true,
            itemCount: storiesForSubtraction.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Provider.of<StoryProvider>(context, listen: false)
                    .getStory(storiesForSubtraction[index]);
                context.pushNamed(Routes.readingStory);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: StoryCardWidget(
                  colors: [
                    ColorsManager.secondBlueColor,
                    ColorsManager.mainBlue
                  ],
                  story: storiesForSubtraction[index],
                ),
              ),
            ),
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
