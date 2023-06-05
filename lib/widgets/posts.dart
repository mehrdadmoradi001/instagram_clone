import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../res/colors.dart';
import 'custom_icon_button.dart';

class Posts extends StatefulWidget {
  final List<String> imagesUrl;
  const Posts({
    required this.imagesUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  int _selectedPost = 0;

  @override
  Widget build(BuildContext context) {
    final int postsLength = widget.imagesUrl.length;
    final Size deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: deviceSize.width,
          height: deviceSize.width,
          child: Stack(
            children: [
              if (widget.imagesUrl.isNotEmpty)
                PageView.builder(
                  itemCount: postsLength,
                  itemBuilder: (context, index) {
                    return Image.asset(widget.imagesUrl[index]);
                  },
                  onPageChanged: (value) {
                    setState(() {
                      _selectedPost = value;
                    });
                  },
                ),
              if (widget.imagesUrl.isEmpty)
                Container(
                  width: deviceSize.width,
                  height: deviceSize.width,
                  color: Colors.grey.withOpacity(.4),
                  child: const Center(
                    child: Icon(
                      Icons.hide_image_outlined,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                ),
              if (postsLength > 1)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    height: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: MyColors.postsCounter,
                    ),
                    child: Center(
                      child: Text(
                        '${_selectedPost + 1}/$postsLength',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 48,
          child: Stack(
            children: [
              if (postsLength > 1)
                Positioned(
                  top: 21,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 6,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 4),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: postsLength,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: index == _selectedPost
                                ? MyColors.selectedPostPointer
                                : MyColors.disablePostPointer,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              Positioned(
                top: 13.5,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomIconButton(
                            onPressed: () {},
                            icon: Assets.icons.like.svg(),
                            width: 24,
                            height: 21,
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          CustomIconButton(
                            onPressed: () {},
                            icon: Assets.icons.comment.svg(),
                            width: 22,
                            height: 23,
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          CustomIconButton(
                            onPressed: () {},
                            icon: Assets.icons.messenger.svg(),
                            width: 23,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                        ],
                      ),
                      CustomIconButton(
                        onPressed: () {},
                        icon: Assets.icons.save.svg(),
                        width: 21,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
