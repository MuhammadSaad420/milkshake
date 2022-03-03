class UnsplashImage {
  var data;
  UnsplashImage(this.data);
  String getId() {
    return data['id'];
  }

  getUrls() {
    return data['urls'];
  }

  String getRawUrl() {
    return getUrls()['raw'];
  }

  String getFullUrl() {
    return getUrls()['full'];
  }

  String getRegularUrl() {
    return getUrls()['regular'];
  }

  String getSmallUrl() {
    return getUrls()['small'];
  }

  String getThumbUrl() {
    return getUrls()['thumb'];
  }
}
