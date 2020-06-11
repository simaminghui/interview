package service;

import pojo.News;

import java.util.List;

public interface NewsService {
    List<News> allNews();

    News getNewsById(Integer id);

    List<News> getRecentlyNews();
}
