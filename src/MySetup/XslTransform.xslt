<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt"
  exclude-result-prefixes="msxsl"
  xmlns:wix="http://schemas.microsoft.com/wix/2006/wi"
  xmlns:my="my:my"
  xmlns:util="http://schemas.microsoft.com/wix/UtilExtension">

  <xsl:output method="xml" indent="yes" />

  <xsl:strip-space elements="*"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!--<xsl:template match="wix:Component[wix:File[@Source='$(var.MyWindowsService.TargetDir)\MyWindowsService.exe']]">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" />
      <wix:ServiceInstall Id="MyServiceInstall" DisplayName="[SERVICENAME]" Description="[SERVICENAME]" Name="[SERVICENAME]" ErrorControl="ignore" Start="auto" Type="ownProcess" Vital="yes" Interactive="no" Account="[SERVICEUSER]" Password="[SERVICEPSWD]" />
      <wix:ServiceControl Id="MyServiceControl" Name="[SERVICENAME]" Start="install" Stop="both" Remove="uninstall" Wait="yes"/>
      <util:User Id="user" CreateUser="no" Name ="[SERVICEUSER]" Password="[SERVICEPSWD]" LogonAsService="yes" />
    </xsl:copy>
  </xsl:template>-->

  <xsl:template match="wix:Component[wix:File[@Source='$(var.MyWindowsService.TargetDir)\MyWindowsService.exe.config']]">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" />
      <util:XmlFile Id="AppConfigSetSetting1" File="[INSTALLDIR]MyWindowsService.exe.config" Action="setValue" Name="value" Value="1" ElementPath="//configuration/appSettings/add[\[]@key='Setting1'[\]]" Sequence="1" />
      <util:XmlFile Id="AppConfigSetSetting2" File="[INSTALLDIR]MyWindowsService.exe.config" Action="setValue" Name="value" Value="2" ElementPath="//configuration/appSettings/add[\[]@key='Setting2'[\]]" Sequence="1" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>