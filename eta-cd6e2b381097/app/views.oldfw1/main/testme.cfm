<cfsavecontent variable="content">
<?xml version="1.0" encoding="UTF-8"?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
   <SOAP-ENV:Body>
      <idc:service xmlns:idc="http://www.stellent.com/IdcService/" IdcService="CHECKOUT">
         <idc:document dUser="jphustman" dDocName="DOT-JNU_058227" dStatus="EDIT" dPublishState="" dReleaseState="E" dRevClassID="58227" dRevLabel="1" dID="60053">
            <idc:field name="isCurRevEmpty" />
            <idc:field name="CurRevCheckoutUser">jphustman</idc:field>
            <idc:field name="dWfType">Criteria</idc:field>
            <idc:field name="dWorkflowState">E</idc:field>
            <idc:field name="StatusMessage">Unable to check out 'DOT-JNU_058227'. The content item is currently checked out by user 'jphustman'.</idc:field>
            <idc:field name="dWfCurrentStepID">67</idc:field>
            <idc:field name="latestID">60053</idc:field>
            <idc:field name="StatusReason">csRevIsCheckedOut:jphustman</idc:field>
            <idc:field name="wfStepCheckinType">:C:CA:CE:</idc:field>
            <idc:field name="CurRevID">60053</idc:field>
            <idc:field name="dWfStepDescription" />
            <idc:field name="IsNotLatestRev" />
            <idc:field name="dWfStepType">:C:CA:CE:</idc:field>
            <idc:field name="dWfName">eta_workflow</idc:field>
            <idc:field name="StatusCode">-22</idc:field>
            <idc:field name="dWfStepName">contribution</idc:field>
            <idc:field name="dWfDocState">INPROCESS</idc:field>
            <idc:field name="dWfStepWeight">1</idc:field>
            <idc:field name="CurRevIsCheckedOut">1</idc:field>
            <idc:field name="IsWorkflow">1</idc:field>
            <idc:field name="dWfStepID">67</idc:field>
            <idc:field name="dWfStatus">INPROCESS</idc:field>
            <idc:field name="dWfStepIsAll">0</idc:field>
            <idc:field name="dWfID">28</idc:field>
         </idc:document>
      </idc:service>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
</cfsavecontent>

<cfset xmlNodes = new eta.model.services.usefulfunctions().soapToCfxml(content)>

<cfdump var="#xmlNodes.XmlAttributes.IdcService#">
<cfdump var="#xmlNodes#">
