import 'package:news_app/model/heading_model.dart';

List<HeadingModel> getCategories() {
  List<HeadingModel> category = new List<HeadingModel>();
  HeadingModel headingModel = new HeadingModel();

  headingModel.HeadingName = "Business";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1462899006636-339e08d1844e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "Entertainment";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "General";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1575320181282-9afab399332c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "Health";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1477332552946-cfb384aeaf1c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "Science";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1532094349884-543bc11b234d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "Sports";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1485400031595-976c74cf4e25?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);

  headingModel = new HeadingModel();
  headingModel.HeadingName = "Technology";
  headingModel.imageUrl =
      "https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60";
  category.add(headingModel);
  return category;
}
