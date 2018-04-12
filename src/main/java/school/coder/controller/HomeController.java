package school.coder.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import school.coder.domain.SectionInfo;
import school.coder.domain.TopicInfo;
import school.coder.domain.TopicInfoEx;
import school.coder.service.SectionService;
import school.coder.service.TopicService;

import java.util.List;

@Controller
public class HomeController {
	@Autowired
	private TopicService topicService;
	@Autowired
	private SectionService sectionService;
//	protected Logger log = Logger.getLogger(HomeController.class);
	@RequestMapping("/")
	public ModelAndView index()
	{

		System.out.println("hello");
		List<TopicInfoEx> topicInfoList = topicService.getAllTopics();
		List<SectionInfo> sectionInfoList = sectionService.getAllSections();
		ModelAndView maView = new ModelAndView();
		maView.setViewName("front/index");
		maView.addObject("topics",topicInfoList);
		maView.addObject("sections",sectionInfoList);
		return maView;
	}

}
