import 'package:flutter/material.dart';
import './university_president.dart';
import './main_kku_president.dart';

class ProblemsInfo extends StatefulWidget {
  const ProblemsInfo({Key? key}) : super(key: key);

  @override
  State<ProblemsInfo> createState() => _ProblemsInfoState();
}

class _ProblemsInfoState extends State<ProblemsInfo> {
  var probInfo = {
    1: {
      'choice1': 'MIT',
      'choice2': 'Pittsburg',
      'choice3': 'Ohio',
      'choice4': 'Chulalongkorn University',
      'answer': 'Chulalongkorn University',
      'title': 'Question1',
      'imgUrl':
          "https://adaymagazine.com/wp-content/uploads/2018/11/chulaaaaaaaaa-4.jpg",
    },
    2: {
      'choice1': 'University of Japan',
      'choice2': 'University of Hong Kong',
      'choice3': 'Columbia University',
      'choice4': 'Khon Kaen University',
      'answer': 'Khon Kaen University',
      'title': 'Question2',
      'imgUrl':
          'https://25433508-a-62cb3a1a-s-sites.googlegroups.com/site/2533yingwan/sxb-klang-phakh-2-2554/1-mhawithyalay-khxnkaen/kku1.jpg?attachauth=ANoY7crCiHeqG2unEvNVddiAJxgD4N-Xj5EfQ3fRVy_HcGd9vu4h1_vwWETq-Tz9ho6AXNtt-SsdFgIVlHR26pkJmeyTIyr_XxA4euVsyYazUge9nfVfdU1CdrNivo2bqXVLsp7BNd9jwPyZlI3h_8UXuDLshAPEzfyFQbSbvNrSS9brJhCJqrAEYhc7NN_QIQ709bs9h4yWZchze3h5-y-_ClEDboRLwGrtVe-SjtnCRY_zcmr8r2s7lCk7UV7iXQvI_o_T8kYtuY7SL468ZCQsc1U6p_EKhA%3D%3D&attredirects=0'
    },
    3: {
      'choice1': 'Michigan University',
      'choice2': 'Gonzaka University',
      'choice3': 'UCLA University',
      'choice4': 'Chiang Mai University',
      'answer': '3',
      'title': 'Question3',
      'imgUrl':
          'https://upload.wikimedia.org/wikipedia/commons/1/17/Chiang_Mai_University_Front_Gate.jpg'
    },
  };

  @override
  Widget build(BuildContext context) {
    return Quiz(num: 1, info: probInfo);
  }
}