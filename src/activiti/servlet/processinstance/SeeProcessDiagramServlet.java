package activiti.servlet.processinstance;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.bpmn.model.GraphicInfo;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.impl.util.json.JSONObject;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.web.bind.annotation.ResponseBody;

import activiti.common.ProcessEngineUtils;

/**
 * Servlet implementation class SeeProcessDiagramServlet
 */
@WebServlet("/seeProcessdiagram.action")
public class SeeProcessDiagramServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 获取流程实例id
		 */
		String id = (String) request.getParameter("piId");
		/**
		 * 获取流程引擎
		 */
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		/**
		 * 获取仓储服务 
		 */
		RepositoryService repositoryService = pe.getRepositoryService();
		/**
		 * 获取RuntimeService
		 */
		RuntimeService runtimeService = pe.getRuntimeService();
		/**
		 * 根据流程实例id获取流程实例
		 */
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(id).singleResult();
		/**
		 * 根据流程定义id获取流程定义图片对应的输入流
		 */
		InputStream inputStream = repositoryService.getProcessDiagram(pi.getProcessDefinitionId());
		/**
		 * 把输入流转换成缓冲流图片
		 */
		BufferedImage image = ImageIO.read(inputStream);
		/**
		 * 获取画笔
		 */
		Graphics2D g = (Graphics2D) image.getGraphics();
		/**
		 * 获取画笔的颜色
		 */
		g.setColor(Color.RED);
		/**
		 * 设置画笔的粗细
		 */
		g.setStroke(new BasicStroke(3.0f));
		/**
		 * 消除锯齿
		 */
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		/**
		 * 查询流程定义文件
		 */
		 BpmnModel bpmnModel = repositoryService.getBpmnModel(pi.getProcessDefinitionId());  
		 /**
		  * 获取当前流程实例活动的节点
		  */
		 List<String> activityIds = runtimeService.getActiveActivityIds(id);  
		 /**
		  * 循环流程实例活动的节点
		  */
		 for(String activityId : activityIds){
			 /*<bpmndi:BPMNShape bpmnElement="receivetask1" id="BPMNShape_receivetask1">
		        <omgdc:Bounds height="55.0" width="105.0" x="110.0" y="81.0"></omgdc:Bounds>
		      </bpmndi:BPMNShape> */
			 GraphicInfo gi = bpmnModel.getGraphicInfo(activityId);
			 /**
			  * 绘制圆角矩形
			  */
			 g.drawRoundRect((int)gi.getX(), (int)gi.getY(), (int)gi.getWidth(), (int)gi.getHeight(), 10, 10);
		 }
		/**
		 * 设置响应的数据是图片
		 */
		response.setContentType("images/png");
		/**
		 * 向浏览器输出图片
		 */
		ImageIO.write(image, "png", response.getOutputStream());
	}
}
