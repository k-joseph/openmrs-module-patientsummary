<%@ include file="template/reportingInclude.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="template/localHeader.jsp"%>

<openmrs:require privilege="Manage Patient Summaries"
	otherwise="/login.htm"
	redirect="/module/patientsummary/patientSummaryReportDefinitionEditor.form" />

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#previewButton').click(function(event) { 
			showReportingDialog({ 
				title: '<spring:message code="reporting.preview" />', 
				url: '<c:url value="/module/reporting/parameters/queryParameter.form"/>?uuid=${report.uuid}&type=${report['class'].name}'
			});
		}).height(32);
	});
</script>

<div id="page">
	<div id="container">
		<table style="font-size: small; width: 100%;">
			<tr>
				<td style="vertical-align: top; width: 25%;"> <openmrs:portlet
						url="baseMetadata" id="baseMetadata" moduleId="reporting"
						parameters="type=${report['class'].name}|uuid=${report.uuid}|size=380|label=Basic Details" />
					<br /> <b class="boxHeader">Output Designs</b>
					<div class="box">
						<c:if test="${!empty designs}">
							<table width="100%" style="margin-bottom: 5px;">
								<tr>
									<th style="text-align: left; border-bottom: 1px solid black;">Name</th>
									<th style="text-align: left; border-bottom: 1px solid black;">Type</th>
									<th style="border-bottom: 1px solid black;">[X]</th>
								</tr>
								<c:forEach items="${designs}" var="design"
									varStatus="designStatus">
									<tr>
										<td nowrap><a href="#" id="${design.uuid}DesignEditLink">${design.name}</a></td>
										<td width="100%">${design.rendererType.simpleName}</td>
										<td nowrap align="center"><a href="#"
											id="${design.uuid}DesignRemoveLink">[X]</a></td>
									</tr>
								</c:forEach>
							</table>
						</c:if>
						<a style="font-weight: bold;" href="#" id="designAddLink">[+]
							Add</a>
					</div> <br />
					<button id="previewButton">
						<img src="<c:url value="/images/play.gif"/>" border="0" />
						<spring:message code="reporting.preview" />
					</button>		
				</td>
				<td>&nbsp;&nbsp;</td>
				<td style="vertical-align: top; width: 75%;"><b
					class="boxHeader">Patient Dataset Definition</b> <%@ include
						file="patientDataSetEditor.jsp"%>
				</td>
			</tr>
		</table>
	</div>
</div>

<%@ include file="/WEB-INF/template/footer.jsp"%>