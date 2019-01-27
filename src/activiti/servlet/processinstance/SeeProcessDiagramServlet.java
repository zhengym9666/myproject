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
		 * ��ȡ����ʵ��id
		 */
		String id = (String) request.getParameter("piId");
		/**
		 * ��ȡ��������
		 */
		ProcessEngine pe = ProcessEngineUtils.getProcessEngine();
		/**
		 * ��ȡ�ִ����� 
		 */
		RepositoryService repositoryService = pe.getRepositoryService();
		/**
		 * ��ȡRuntimeService
		 */
		RuntimeService runtimeService = pe.getRuntimeService();
		/**
		 * ��������ʵ��id��ȡ����ʵ��
		 */
		ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(id).singleResult();
		/**
		 * �������̶���id��ȡ���̶���ͼƬ��Ӧ��������
		 */
		InputStream inputStream = repositoryService.getProcessDiagram(pi.getProcessDefinitionId());
		/**
		 * ��������ת���ɻ�����ͼƬ
		 */
		BufferedImage image = ImageIO.read(inputStream);
		/**
		 * ��ȡ����
		 */
		Graphics2D g = (Graphics2D) image.getGraphics();
		/**
		 * ��ȡ���ʵ���ɫ
		 */
		g.setColor(Color.RED);
		/**
		 * ���û��ʵĴ�ϸ
		 */
		g.setStroke(new BasicStroke(3.0f));
		/**
		 * �������
		 */
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		/**
		 * ��ѯ���̶����ļ�
		 */
		 BpmnModel bpmnModel = repositoryService.getBpmnModel(pi.getProcessDefinitionId());  
		 /**
		  * ��ȡ��ǰ����ʵ����Ľڵ�
		  */
		 List<String> activityIds = runtimeService.getActiveActivityIds(id);  
		 /**
		  * ѭ������ʵ����Ľڵ�
		  */
		 for(String activityId : activityIds){
			 /*<bpmndi:BPMNShape bpmnElement="receivetask1" id="BPMNShape_receivetask1">
		        <omgdc:Bounds height="55.0" width="105.0" x="110.0" y="81.0"></omgdc:Bounds>
		      </bpmndi:BPMNShape> */
			 GraphicInfo gi = bpmnModel.getGraphicInfo(activityId);
			 /**
			  * ����Բ�Ǿ���
			  */
			 g.drawRoundRect((int)gi.getX(), (int)gi.getY(), (int)gi.getWidth(), (int)gi.getHeight(), 10, 10);
		 }
		/**
		 * ������Ӧ��������ͼƬ
		 */
		response.setContentType("images/png");
		/**
		 * ����������ͼƬ
		 */
		ImageIO.write(image, "png", response.getOutputStream());
	}
}
