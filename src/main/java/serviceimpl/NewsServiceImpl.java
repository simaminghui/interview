package serviceimpl;

import dao.NewsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.News;
import pojo.NewsExample;
import service.NewsService;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    /**得到新闻*/
    public List<News> allNews() {
        NewsExample example=new NewsExample();
        example.setOrderByClause("time DESC");
        return newsMapper.selectByExample(example);
    }

    public News getNewsById(Integer id) {
        News news = newsMapper.selectByPrimaryKey(id);
        return news;
    }

    public List<News> getRecentlyNews() {

        NewsExample example=new NewsExample();
        example.setOrderByClause("time DESC");
        /**全部新闻*/
        List<News> news = newsMapper.selectByExample(example);

        List<News>  result=new ArrayList<News>();
        int length=news.size();

        for (int i=0;i<length;i++)
        {
            if (i<3)
                result.add(news.get(i));
            else
                break;;
        }

        return result;
    }
}
