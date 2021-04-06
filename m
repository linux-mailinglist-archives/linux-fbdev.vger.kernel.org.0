Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F884354FB1
	for <lists+linux-fbdev@lfdr.de>; Tue,  6 Apr 2021 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241073AbhDFJSy (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 6 Apr 2021 05:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235399AbhDFJSx (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 6 Apr 2021 05:18:53 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38CDC06174A;
        Tue,  6 Apr 2021 02:18:45 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id v10so9972417pfn.5;
        Tue, 06 Apr 2021 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=7oqGpLls66bHwapqL8kfF0u4fQyBWqliIYjpLSWLACc=;
        b=Fgmt5chs7V05N8zneTuWyLJ88TNOnj3kvQHduqV8pM+RILuNkVolc26tVMIQWkXf3n
         DojJhEs0KVwo6Pw+1HGkynZoCxuMbJDAazXMY1xYtpcJ8FPr/6m3aAyCgQQB2jMzuUI3
         PHBpdUCcwgdnlT9l0/9SgDeRBi+u+FnPSZwEfcCrHBUa37L+TKxEy/hNAyboyBBy/HEf
         P0a7HejsWcmuC+X3L3BUUB++iLP6zu/JjFt56kvKTsBXQF/NzyrIugD8BNZU8hDfrLdH
         X4+j7hCS/RDSnD0bfinZZ1nnfZj604c2JL+j8XcDPG5Egxvs3fm3FPQZEbBcXQA8/utX
         oF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=7oqGpLls66bHwapqL8kfF0u4fQyBWqliIYjpLSWLACc=;
        b=PYtV70+9jFeBzHBSVYC/+wDPwx/z90xBIloEDlE4/ju8eaM8+pfzzleiuNB68utOJJ
         fT+ejbMtM/5eY41UmPXREzll4/EEMdy/5j9mGFOkgjjuLE+aM/fjZDvmSNghhf7a9Szk
         APh9yUxaHV5Ehgt5t/Sk8VDJtWKbygCuaEcjgjwr0EbUQIzGKXvkN2LPvPU6sQlo1MNY
         gRAm5yrG0qaR1unN2wR5bfhPKaLx7WfxujoIZSsVLYcXCXJmVcFvjPQLY04u7tGONz3L
         zTRPpEOdctLI1zqp4tj7ZpAlWtGgkizDEOhGnNhkHHPVcBZJmagJLx44G3pTeZtbiTMv
         SAqA==
X-Gm-Message-State: AOAM531MLotw/Dlr0dnz5aaBpTjvIW9BNKGARWaaCI0yNVVlBE9UNk5O
        rH4dsTjmjSReHSWqpyVCaxo=
X-Google-Smtp-Source: ABdhPJxp8/DFad08V2rbMSi2VPrHyGmXuzJK8Gpxh07fmpatF58A+9iysPEUqROvoUw5iyJtBHRXuw==
X-Received: by 2002:aa7:87c5:0:b029:202:b279:c7e5 with SMTP id i5-20020aa787c50000b0290202b279c7e5mr27224617pfo.27.1617700724917;
        Tue, 06 Apr 2021 02:18:44 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id q66sm1990384pja.27.2021.04.06.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 02:18:44 -0700 (PDT)
Date:   Tue, 6 Apr 2021 02:18:41 -0700
From:   Pavle Rohalj <pavle.rohalj@gmail.com>
To:     sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
        gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: Convert camel case to snake case
Message-ID: <YGwncT6RGvYlL9yj@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix "Avoid CamelCase" checkpatch.pl checks for 106 camel case
instances:

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    |  32 ++---
 drivers/staging/sm750fb/ddk750_dvi.h    |  64 +++++-----
 drivers/staging/sm750fb/ddk750_mode.c   |  88 +++++++-------
 drivers/staging/sm750fb/ddk750_mode.h   |   2 +-
 drivers/staging/sm750fb/ddk750_power.h  |  10 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 152 ++++++++++++------------
 drivers/staging/sm750fb/ddk750_sii164.h |  40 +++----
 drivers/staging/sm750fb/sm750.c         | 128 ++++++++++----------
 drivers/staging/sm750fb/sm750.h         |  54 ++++-----
 drivers/staging/sm750fb/sm750_accel.c   | 148 +++++++++++------------
 drivers/staging/sm750fb/sm750_accel.h   |  42 +++----
 drivers/staging/sm750fb/sm750_cursor.c  |  14 +--
 drivers/staging/sm750fb/sm750_cursor.h  |  10 +-
 drivers/staging/sm750fb/sm750_hw.c      |  54 ++++-----
 14 files changed, 419 insertions(+), 419 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index cd564ea40779..a11b5fae45fa 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -11,26 +11,26 @@
  * function API. Please set the function pointer to NULL whenever the function
  * is not supported.
  */
-static struct dvi_ctrl_device g_dcftSupportedDviController[] = {
+static struct dvi_ctrl_device g_dcft_supported_dvi_controller[] = {
 #ifdef DVI_CTRL_SII164
 	{
-		.pfnInit = sii164InitChip,
-		.pfnGetVendorId = sii164GetVendorID,
-		.pfnGetDeviceId = sii164GetDeviceID,
+		.pfn_init = sii164_init_chip,
+		.pfn_get_vendor_id = sii164_get_vendor_id,
+		.pfn_get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.pfnResetChip = sii164ResetChip,
-		.pfnGetChipString = sii164GetChipString,
-		.pfnSetPower = sii164SetPower,
-		.pfnEnableHotPlugDetection = sii164EnableHotPlugDetection,
-		.pfnIsConnected = sii164IsConnected,
-		.pfnCheckInterrupt = sii164CheckInterrupt,
-		.pfnClearInterrupt = sii164ClearInterrupt,
+		.pfn_reset_chip = sii164_reset_chip,
+		.pfn_get_chip_string = sii164_get_chip_string,
+		.pfn_set_power = sii164_set_power,
+		.pfn_enable_hot_plug_detection = sii164_enable_hot_plug_detection,
+		.pfn_is_connected = sii164_is_connected,
+		.pfn_check_interrupt = sii164_check_interrupt,
+		.pfn_clear_interrupt = sii164_clear_interrupt,
 #endif
 	},
 #endif
 };
 
-int dviInit(unsigned char edge_select,
+int dvi_init(unsigned char edge_select,
 	    unsigned char bus_select,
 	    unsigned char dual_edge_clk_select,
 	    unsigned char hsync_enable,
@@ -41,11 +41,11 @@ int dviInit(unsigned char edge_select,
 	    unsigned char pll_filter_enable,
 	    unsigned char pll_filter_value)
 {
-	struct dvi_ctrl_device *pCurrentDviCtrl;
+	struct dvi_ctrl_device *p_current_dvi_ctrl;
 
-	pCurrentDviCtrl = g_dcftSupportedDviController;
-	if (pCurrentDviCtrl->pfnInit) {
-		return pCurrentDviCtrl->pfnInit(edge_select,
+	p_current_dvi_ctrl = g_dcft_supported_dvi_controller;
+	if (p_current_dvi_ctrl->pfn_init) {
+		return p_current_dvi_ctrl->pfn_init(edge_select,
 						bus_select,
 						dual_edge_clk_select,
 						hsync_enable,
diff --git a/drivers/staging/sm750fb/ddk750_dvi.h b/drivers/staging/sm750fb/ddk750_dvi.h
index 1c7a565b617a..57ae2d2672a7 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.h
+++ b/drivers/staging/sm750fb/ddk750_dvi.h
@@ -4,54 +4,54 @@
 
 /* dvi chip stuffs structros */
 
-typedef long (*PFN_DVICTRL_INIT)(unsigned char edgeSelect,
-				 unsigned char busSelect,
-				 unsigned char dualEdgeClkSelect,
-				 unsigned char hsyncEnable,
-				 unsigned char vsyncEnable,
-				 unsigned char deskewEnable,
-				 unsigned char deskewSetting,
-				 unsigned char continuousSyncEnable,
-				 unsigned char pllFilterEnable,
-				 unsigned char pllFilterValue);
+typedef long (*PFN_DVICTRL_INIT)(unsigned char edge_select,
+				 unsigned char bus_select,
+				 unsigned char dual_edge_clk_select,
+				 unsigned char hsync_enable,
+				 unsigned char vsync_enable,
+				 unsigned char deskew_enable,
+				 unsigned char deskew_setting,
+				 unsigned char continuous_sync_enable,
+				 unsigned char pll_filter_enable,
+				 unsigned char pll_filter_value);
 
 typedef void (*PFN_DVICTRL_RESETCHIP)(void);
 typedef char* (*PFN_DVICTRL_GETCHIPSTRING)(void);
 typedef unsigned short (*PFN_DVICTRL_GETVENDORID)(void);
 typedef unsigned short (*PFN_DVICTRL_GETDEVICEID)(void);
-typedef void (*PFN_DVICTRL_SETPOWER)(unsigned char powerUp);
-typedef void (*PFN_DVICTRL_HOTPLUGDETECTION)(unsigned char enableHotPlug);
+typedef void (*PFN_DVICTRL_SETPOWER)(unsigned char power_up);
+typedef void (*PFN_DVICTRL_HOTPLUGDETECTION)(unsigned char enable_hot_plug);
 typedef unsigned char (*PFN_DVICTRL_ISCONNECTED)(void);
 typedef unsigned char (*PFN_DVICTRL_CHECKINTERRUPT)(void);
 typedef void (*PFN_DVICTRL_CLEARINTERRUPT)(void);
 
 /* Structure to hold all the function pointer to the DVI Controller. */
 struct dvi_ctrl_device {
-	PFN_DVICTRL_INIT		pfnInit;
-	PFN_DVICTRL_RESETCHIP		pfnResetChip;
-	PFN_DVICTRL_GETCHIPSTRING	pfnGetChipString;
-	PFN_DVICTRL_GETVENDORID		pfnGetVendorId;
-	PFN_DVICTRL_GETDEVICEID		pfnGetDeviceId;
-	PFN_DVICTRL_SETPOWER		pfnSetPower;
-	PFN_DVICTRL_HOTPLUGDETECTION	pfnEnableHotPlugDetection;
-	PFN_DVICTRL_ISCONNECTED		pfnIsConnected;
-	PFN_DVICTRL_CHECKINTERRUPT	pfnCheckInterrupt;
-	PFN_DVICTRL_CLEARINTERRUPT	pfnClearInterrupt;
+	PFN_DVICTRL_INIT		pfn_init;
+	PFN_DVICTRL_RESETCHIP		pfn_reset_chip;
+	PFN_DVICTRL_GETCHIPSTRING	pfn_get_chip_string;
+	PFN_DVICTRL_GETVENDORID		pfn_get_vendor_id;
+	PFN_DVICTRL_GETDEVICEID		pfn_get_device_id;
+	PFN_DVICTRL_SETPOWER		pfn_set_power;
+	PFN_DVICTRL_HOTPLUGDETECTION	pfn_enable_hot_plug_detection;
+	PFN_DVICTRL_ISCONNECTED		pfn_is_connected;
+	PFN_DVICTRL_CHECKINTERRUPT	pfn_check_interrupt;
+	PFN_DVICTRL_CLEARINTERRUPT	pfn_clear_interrupt;
 };
 
 #define DVI_CTRL_SII164
 
 /* dvi functions prototype */
-int dviInit(unsigned char edgeSelect,
-	    unsigned char busSelect,
-	    unsigned char dualEdgeClkSelect,
-	    unsigned char hsyncEnable,
-	    unsigned char vsyncEnable,
-	    unsigned char deskewEnable,
-	    unsigned char deskewSetting,
-	    unsigned char continuousSyncEnable,
-	    unsigned char pllFilterEnable,
-	    unsigned char pllFilterValue);
+int dvi_init(unsigned char edge_select,
+	    unsigned char bus_select,
+	    unsigned char dual_edge_clk_select,
+	    unsigned char hsync_enable,
+	    unsigned char vsync_enable,
+	    unsigned char deskew_enable,
+	    unsigned char deskew_setting,
+	    unsigned char continuous_sync_enable,
+	    unsigned char pll_filter_enable,
+	    unsigned char pll_filter_value);
 
 #endif
 
diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e00a6cb31947..5628d4fbb908 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,13 +14,13 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
-			     unsigned long dispControl)
+display_control_adjust_sm750le(struct mode_parameter *p_mode_param,
+			     unsigned long disp_control)
 {
 	unsigned long x, y;
 
-	x = pModeParam->horizontal_display_end;
-	y = pModeParam->vertical_display_end;
+	x = p_mode_param->horizontal_display_end;
+	y = p_mode_param->vertical_display_end;
 
 	/*
 	 * SM750LE has to set up the top-left and bottom-right
@@ -36,46 +36,46 @@ displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
 	       ((x - 1) & CRT_AUTO_CENTERING_BR_RIGHT_MASK));
 
 	/*
-	 * Assume common fields in dispControl have been properly set before
+	 * Assume common fields in disp_control have been properly set before
 	 * calling this function.
-	 * This function only sets the extra fields in dispControl.
+	 * This function only sets the extra fields in disp_control.
 	 */
 
 	/* Clear bit 29:27 of display control register */
-	dispControl &= ~CRT_DISPLAY_CTRL_CLK_MASK;
+	disp_control &= ~CRT_DISPLAY_CTRL_CLK_MASK;
 
 	/* Set bit 29:27 of display control register for the right clock */
 	/* Note that SM750LE only need to supported 7 resolutions. */
 	if (x == 800 && y == 600)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL41;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL41;
 	else if (x == 1024 && y == 768)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL65;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL65;
 	else if (x == 1152 && y == 864)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
 	else if (x == 1280 && y == 768)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL80;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL80;
 	else if (x == 1280 && y == 720)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL74;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL74;
 	else if (x == 1280 && y == 960)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
 	else if (x == 1280 && y == 1024)
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL108;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL108;
 	else /* default to VGA clock */
-		dispControl |= CRT_DISPLAY_CTRL_CLK_PLL25;
+		disp_control |= CRT_DISPLAY_CTRL_CLK_PLL25;
 
 	/* Set bit 25:24 of display controller */
-	dispControl |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
+	disp_control |= (CRT_DISPLAY_CTRL_CRTSELECT | CRT_DISPLAY_CTRL_RGBBIT);
 
 	/* Set bit 14 of display controller */
-	dispControl |= DISPLAY_CTRL_CLOCK_PHASE;
+	disp_control |= DISPLAY_CTRL_CLOCK_PHASE;
 
-	poke32(CRT_DISPLAY_CTRL, dispControl);
+	poke32(CRT_DISPLAY_CTRL, disp_control);
 
-	return dispControl;
+	return disp_control;
 }
 
 /* only timing related registers will be  programed */
-static int programModeRegisters(struct mode_parameter *pModeParam,
+static int program_mode_registers(struct mode_parameter *p_mode_param,
 				struct pll_value *pll)
 {
 	int ret = 0;
@@ -86,46 +86,46 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 		/* programe secondary pixel clock */
 		poke32(CRT_PLL_CTRL, sm750_format_pll_reg(pll));
 
-		tmp = ((pModeParam->horizontal_total - 1) <<
+		tmp = ((p_mode_param->horizontal_total - 1) <<
 		       CRT_HORIZONTAL_TOTAL_TOTAL_SHIFT) &
 		     CRT_HORIZONTAL_TOTAL_TOTAL_MASK;
-		tmp |= (pModeParam->horizontal_display_end - 1) &
+		tmp |= (p_mode_param->horizontal_display_end - 1) &
 		      CRT_HORIZONTAL_TOTAL_DISPLAY_END_MASK;
 
 		poke32(CRT_HORIZONTAL_TOTAL, tmp);
 
-		tmp = (pModeParam->horizontal_sync_width <<
+		tmp = (p_mode_param->horizontal_sync_width <<
 		       CRT_HORIZONTAL_SYNC_WIDTH_SHIFT) &
 		     CRT_HORIZONTAL_SYNC_WIDTH_MASK;
-		tmp |= (pModeParam->horizontal_sync_start - 1) &
+		tmp |= (p_mode_param->horizontal_sync_start - 1) &
 		      CRT_HORIZONTAL_SYNC_START_MASK;
 
 		poke32(CRT_HORIZONTAL_SYNC, tmp);
 
-		tmp = ((pModeParam->vertical_total - 1) <<
+		tmp = ((p_mode_param->vertical_total - 1) <<
 		       CRT_VERTICAL_TOTAL_TOTAL_SHIFT) &
 		     CRT_VERTICAL_TOTAL_TOTAL_MASK;
-		tmp |= (pModeParam->vertical_display_end - 1) &
+		tmp |= (p_mode_param->vertical_display_end - 1) &
 		      CRT_VERTICAL_TOTAL_DISPLAY_END_MASK;
 
 		poke32(CRT_VERTICAL_TOTAL, tmp);
 
-		tmp = ((pModeParam->vertical_sync_height <<
+		tmp = ((p_mode_param->vertical_sync_height <<
 		       CRT_VERTICAL_SYNC_HEIGHT_SHIFT)) &
 		     CRT_VERTICAL_SYNC_HEIGHT_MASK;
-		tmp |= (pModeParam->vertical_sync_start - 1) &
+		tmp |= (p_mode_param->vertical_sync_start - 1) &
 		      CRT_VERTICAL_SYNC_START_MASK;
 
 		poke32(CRT_VERTICAL_SYNC, tmp);
 
 		tmp = DISPLAY_CTRL_TIMING | DISPLAY_CTRL_PLANE;
-		if (pModeParam->vertical_sync_polarity)
+		if (p_mode_param->vertical_sync_polarity)
 			tmp |= DISPLAY_CTRL_VSYNC_PHASE;
-		if (pModeParam->horizontal_sync_polarity)
+		if (p_mode_param->horizontal_sync_polarity)
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			displayControlAdjust_SM750LE(pModeParam, tmp);
+			display_control_adjust_sm750le(p_mode_param, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
@@ -140,40 +140,40 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 
 		poke32(PANEL_PLL_CTRL, sm750_format_pll_reg(pll));
 
-		reg = ((pModeParam->horizontal_total - 1) <<
+		reg = ((p_mode_param->horizontal_total - 1) <<
 			PANEL_HORIZONTAL_TOTAL_TOTAL_SHIFT) &
 			PANEL_HORIZONTAL_TOTAL_TOTAL_MASK;
-		reg |= ((pModeParam->horizontal_display_end - 1) &
+		reg |= ((p_mode_param->horizontal_display_end - 1) &
 			PANEL_HORIZONTAL_TOTAL_DISPLAY_END_MASK);
 		poke32(PANEL_HORIZONTAL_TOTAL, reg);
 
 		poke32(PANEL_HORIZONTAL_SYNC,
-		       ((pModeParam->horizontal_sync_width <<
+		       ((p_mode_param->horizontal_sync_width <<
 			 PANEL_HORIZONTAL_SYNC_WIDTH_SHIFT) &
 			PANEL_HORIZONTAL_SYNC_WIDTH_MASK) |
-		       ((pModeParam->horizontal_sync_start - 1) &
+		       ((p_mode_param->horizontal_sync_start - 1) &
 			PANEL_HORIZONTAL_SYNC_START_MASK));
 
 		poke32(PANEL_VERTICAL_TOTAL,
-		       (((pModeParam->vertical_total - 1) <<
+		       (((p_mode_param->vertical_total - 1) <<
 			 PANEL_VERTICAL_TOTAL_TOTAL_SHIFT) &
 			PANEL_VERTICAL_TOTAL_TOTAL_MASK) |
-		       ((pModeParam->vertical_display_end - 1) &
+		       ((p_mode_param->vertical_display_end - 1) &
 			PANEL_VERTICAL_TOTAL_DISPLAY_END_MASK));
 
 		poke32(PANEL_VERTICAL_SYNC,
-		       ((pModeParam->vertical_sync_height <<
+		       ((p_mode_param->vertical_sync_height <<
 			 PANEL_VERTICAL_SYNC_HEIGHT_SHIFT) &
 			PANEL_VERTICAL_SYNC_HEIGHT_MASK) |
-		       ((pModeParam->vertical_sync_start - 1) &
+		       ((p_mode_param->vertical_sync_start - 1) &
 			PANEL_VERTICAL_SYNC_START_MASK));
 
 		tmp = DISPLAY_CTRL_TIMING | DISPLAY_CTRL_PLANE;
-		if (pModeParam->vertical_sync_polarity)
+		if (p_mode_param->vertical_sync_polarity)
 			tmp |= DISPLAY_CTRL_VSYNC_PHASE;
-		if (pModeParam->horizontal_sync_polarity)
+		if (p_mode_param->horizontal_sync_polarity)
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
-		if (pModeParam->clock_phase_polarity)
+		if (p_mode_param->clock_phase_polarity)
 			tmp |= DISPLAY_CTRL_CLOCK_PHASE;
 
 		reserved = PANEL_DISPLAY_CTRL_RESERVED_MASK |
@@ -207,7 +207,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 	return ret;
 }
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock)
 {
 	struct pll_value pll;
 
@@ -220,6 +220,6 @@ int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock)
 		outb_p(0x88, 0x3d4);
 		outb_p(0x06, 0x3d5);
 	}
-	programModeRegisters(parm, &pll);
+	program_mode_registers(parm, &pll);
 	return 0;
 }
diff --git a/drivers/staging/sm750fb/ddk750_mode.h b/drivers/staging/sm750fb/ddk750_mode.h
index 2df78a0937b2..1b70885f85e5 100644
--- a/drivers/staging/sm750fb/ddk750_mode.h
+++ b/drivers/staging/sm750fb/ddk750_mode.h
@@ -33,5 +33,5 @@ struct mode_parameter {
 	enum spolarity clock_phase_polarity;
 };
 
-int ddk750_setModeTiming(struct mode_parameter *parm, enum clock_type clock);
+int ddk750_set_mode_timing(struct mode_parameter *parm, enum clock_type clock);
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 7002567a47d2..993b868438f6 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -3,10 +3,10 @@
 #define DDK750_POWER_H__
 
 enum dpms {
-	crtDPMS_ON = 0x0,
-	crtDPMS_STANDBY = 0x1,
-	crtDPMS_SUSPEND = 0x2,
-	crtDPMS_OFF = 0x3,
+	crt_dpms_on = 0x0,
+	crt_dpms_standby = 0x1,
+	crt_dpms_suspend = 0x2,
+	crt_dpms_off = 0x3,
 };
 
 #define set_DAC(off) {							\
@@ -15,7 +15,7 @@ enum dpms {
 }
 
 void ddk750_set_dpms(enum dpms state);
-void sm750_set_power_mode(unsigned int powerMode);
+void sm750_set_power_mode(unsigned int power_mode);
 void sm750_set_current_gate(unsigned int gate);
 
 /*
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 73e0e9f41ec5..1b9b4c8428fd 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -12,11 +12,11 @@
 #define USE_HW_I2C
 
 #ifdef USE_HW_I2C
-    #define i2cWriteReg sm750_hw_i2c_write_reg
-    #define i2cReadReg  sm750_hw_i2c_read_reg
+    #define i2c_write_reg sm750_hw_i2c_write_reg
+    #define i2c_read_reg  sm750_hw_i2c_read_reg
 #else
-    #define i2cWriteReg sm750_sw_i2c_write_reg
-    #define i2cReadReg  sm750_sw_i2c_read_reg
+    #define i2c_write_reg sm750_sw_i2c_write_reg
+    #define i2c_read_reg  sm750_sw_i2c_read_reg
 #endif
 
 /* SII164 Vendor and Device ID */
@@ -25,45 +25,45 @@
 
 #ifdef SII164_FULL_FUNCTIONS
 /* Name of the DVI Controller chip */
-static char *gDviCtrlChipName = "Silicon Image SiI 164";
+static char *g_dvi_ctrl_chip_name = "Silicon Image SiI 164";
 #endif
 
 /*
- *  sii164GetVendorID
+ *  sii164_get_vendor_id
  *      This function gets the vendor ID of the DVI controller chip.
  *
  *  Output:
  *      Vendor ID
  */
-unsigned short sii164GetVendorID(void)
+unsigned short sii164_get_vendor_id(void)
 {
-	unsigned short vendorID;
+	unsigned short vendor_id;
 
-	vendorID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+	vendor_id = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_VENDOR_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_VENDOR_ID_LOW);
 
-	return vendorID;
+	return vendor_id;
 }
 
 /*
- *  sii164GetDeviceID
+ *  sii164_get_device_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
-	unsigned short deviceID;
+	unsigned short device_id;
 
-	deviceID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+	device_id = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					       SII164_DEVICE_ID_HIGH) << 8) |
-		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
+		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
 					      SII164_DEVICE_ID_LOW);
 
-	return deviceID;
+	return device_id;
 }
 
 /*
@@ -72,7 +72,7 @@ unsigned short sii164GetDeviceID(void)
  */
 
 /*
- *  sii164InitChip
+ *  sii164_init_chip
  *      This function initialize and detect the DVI controller chip.
  *
  *  Input:
@@ -118,7 +118,7 @@ unsigned short sii164GetDeviceID(void)
  *      0   - Success
  *     -1   - Fail.
  */
-long sii164InitChip(unsigned char edge_select,
+long sii164_init_chip(unsigned char edge_select,
 		    unsigned char bus_select,
 		    unsigned char dual_edge_clk_select,
 		    unsigned char hsync_enable,
@@ -140,8 +140,8 @@ long sii164InitChip(unsigned char edge_select,
 #endif
 
 	/* Check if SII164 Chip exists */
-	if ((sii164GetVendorID() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
@@ -176,7 +176,7 @@ long sii164InitChip(unsigned char edge_select,
 		else
 			config |= SII164_CONFIGURATION_VSYNC_AS_IS;
 
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 
 		/*
 		 * De-skew enabled with default 111b value.
@@ -214,7 +214,7 @@ long sii164InitChip(unsigned char edge_select,
 			config |= SII164_DESKEW_8_STEP;
 			break;
 		}
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_DESKEW, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_DESKEW, config);
 
 		/* Enable/Disable Continuous Sync. */
 		if (continuous_sync_enable == 0)
@@ -231,12 +231,12 @@ long sii164InitChip(unsigned char edge_select,
 		/* Set the PLL Filter value */
 		config |= ((pll_filter_value & 0x07) << 1);
 
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_PLL, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_PLL, config);
 
 		/* Recover from Power Down and enable output. */
-		config = i2cReadReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
+		config = i2c_read_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
 		config |= SII164_CONFIGURATION_POWER_NORMAL;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 
 		return 0;
 	}
@@ -250,157 +250,157 @@ long sii164InitChip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
-	sii164SetPower(0);
-	sii164SetPower(1);
+	sii164_set_power(0);
+	sii164_set_power(1);
 }
 
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Controller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
-	return gDviCtrlChipName;
+	return g_dvi_ctrl_chip_name;
 }
 
 /*
- *  sii164SetPower
+ *  sii164_set_power
  *      This function sets the power configuration of the DVI Controller Chip.
  *
  *  Input:
- *      powerUp - Flag to set the power down or up
+ *      power_up - Flag to set the power down or up
  */
-void sii164SetPower(unsigned char powerUp)
+void sii164_set_power(unsigned char power_up)
 {
 	unsigned char config;
 
-	config = i2cReadReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
-	if (powerUp == 1) {
+	config = i2c_read_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION);
+	if (power_up == 1) {
 		/* Power up the chip */
 		config &= ~SII164_CONFIGURATION_POWER_MASK;
 		config |= SII164_CONFIGURATION_POWER_NORMAL;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 	} else {
 		/* Power down the chip */
 		config &= ~SII164_CONFIGURATION_POWER_MASK;
 		config |= SII164_CONFIGURATION_POWER_DOWN;
-		i2cWriteReg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
+		i2c_write_reg(SII164_I2C_ADDRESS, SII164_CONFIGURATION, config);
 	}
 }
 
 /*
- *  sii164SelectHotPlugDetectionMode
+ *  sii164_select_hot_plug_detection_mode
  *      This function selects the mode of the hot plug detection.
  */
 static
-void sii164SelectHotPlugDetectionMode(enum sii164_hot_plug_mode hotPlugMode)
+void sii164_select_hot_plug_detection_mode(enum sii164_hot_plug_mode hot_plug_mode)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    ~SII164_DETECT_MONITOR_SENSE_OUTPUT_FLAG;
-	switch (hotPlugMode) {
+	switch (hot_plug_mode) {
 	case SII164_HOTPLUG_DISABLE:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HIGH;
 		break;
 	case SII164_HOTPLUG_USE_MDI:
-		detectReg &= ~SII164_DETECT_INTERRUPT_MASK;
-		detectReg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
+		detect_reg &= ~SII164_DETECT_INTERRUPT_MASK;
+		detect_reg |= SII164_DETECT_INTERRUPT_BY_HTPLG_PIN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_MDI;
 		break;
 	case SII164_HOTPLUG_USE_RSEN:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_RSEN;
 		break;
 	case SII164_HOTPLUG_USE_HTPLG:
-		detectReg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
+		detect_reg |= SII164_DETECT_MONITOR_SENSE_OUTPUT_HTPLG;
 		break;
 	}
 
-	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT, detectReg);
+	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT, detect_reg);
 }
 
 /*
- *  sii164EnableHotPlugDetection
+ *  sii164_enable_hot_plug_detection
  *      This function enables the Hot Plug detection.
  *
- *  enableHotPlug   - Enable (=1) / disable (=0) Hot Plug detection
+ *  enable_hot_plug   - Enable (=1) / disable (=0) Hot Plug detection
  */
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug)
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
 
 	/* Depending on each DVI controller, need to enable the hot plug based
 	 * on each individual chip design.
 	 */
-	if (enableHotPlug != 0)
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_USE_MDI);
+	if (enable_hot_plug != 0)
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_USE_MDI);
 	else
-		sii164SelectHotPlugDetectionMode(SII164_HOTPLUG_DISABLE);
+		sii164_select_hot_plug_detection_mode(SII164_HOTPLUG_DISABLE);
 }
 
 /*
- *  sii164IsConnected
+ *  sii164_is_connected
  *      Check if the DVI Monitor is connected.
  *
  *  Output:
  *      0   - Not Connected
  *      1   - Connected
  */
-unsigned char sii164IsConnected(void)
+unsigned char sii164_is_connected(void)
 {
-	unsigned char hotPlugValue;
+	unsigned char hot_plug_value;
 
-	hotPlugValue = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	hot_plug_value = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		       SII164_DETECT_HOT_PLUG_STATUS_MASK;
-	if (hotPlugValue == SII164_DETECT_HOT_PLUG_STATUS_ON)
+	if (hot_plug_value == SII164_DETECT_HOT_PLUG_STATUS_ON)
 		return 1;
 	else
 		return 0;
 }
 
 /*
- *  sii164CheckInterrupt
+ *  sii164_check_interrupt
  *      Checks if interrupt has occurred.
  *
  *  Output:
  *      0   - No interrupt
  *      1   - Interrupt occurs
  */
-unsigned char sii164CheckInterrupt(void)
+unsigned char sii164_check_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT) &
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT) &
 		    SII164_DETECT_MONITOR_STATE_MASK;
-	if (detectReg == SII164_DETECT_MONITOR_STATE_CHANGE)
+	if (detect_reg == SII164_DETECT_MONITOR_STATE_CHANGE)
 		return 1;
 	else
 		return 0;
 }
 
 /*
- *  sii164ClearInterrupt
+ *  sii164_clear_interrupt
  *      Clear the hot plug interrupt.
  */
-void sii164ClearInterrupt(void)
+void sii164_clear_interrupt(void)
 {
-	unsigned char detectReg;
+	unsigned char detect_reg;
 
 	/* Clear the MDI interrupt */
-	detectReg = i2cReadReg(SII164_I2C_ADDRESS, SII164_DETECT);
-	i2cWriteReg(SII164_I2C_ADDRESS, SII164_DETECT,
-		    detectReg | SII164_DETECT_MONITOR_STATE_CLEAR);
+	detect_reg = i2c_read_reg(SII164_I2C_ADDRESS, SII164_DETECT);
+	i2c_write_reg(SII164_I2C_ADDRESS, SII164_DETECT,
+		    detect_reg | SII164_DETECT_MONITOR_STATE_CLEAR);
 }
 
 #endif
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index d940cb729066..a414afbb719a 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -16,28 +16,28 @@ enum sii164_hot_plug_mode {
 };
 
 /* Silicon Image SiI164 chip prototype */
-long sii164InitChip(unsigned char edgeSelect,
-		    unsigned char busSelect,
-		    unsigned char dualEdgeClkSelect,
-		    unsigned char hsyncEnable,
-		    unsigned char vsyncEnable,
-		    unsigned char deskewEnable,
-		    unsigned char deskewSetting,
-		    unsigned char continuousSyncEnable,
-		    unsigned char pllFilterEnable,
-		    unsigned char pllFilterValue);
-
-unsigned short sii164GetVendorID(void);
-unsigned short sii164GetDeviceID(void);
+long sii164_init_chip(unsigned char edge_select,
+		    unsigned char bus_select,
+		    unsigned char dual_edge_clk_select,
+		    unsigned char hsync_enable,
+		    unsigned char vsync_enable,
+		    unsigned char deskew_enable,
+		    unsigned char deskew_setting,
+		    unsigned char continuous_sync_enable,
+		    unsigned char pll_filter_enable,
+		    unsigned char pll_filter_value);
+
+unsigned short sii164_get_vendor_id(void);
+unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
-char *sii164GetChipString(void);
-void sii164SetPower(unsigned char powerUp);
-void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-unsigned char sii164IsConnected(void);
-unsigned char sii164CheckInterrupt(void);
-void sii164ClearInterrupt(void);
+void sii164_reset_chip(void);
+char *sii164_get_chip_string(void);
+void sii164_set_power(unsigned char power_up);
+void sii164_enable_hot_plug_detection(unsigned char enable_hot_plug);
+unsigned char sii164_is_connected(void);
+unsigned char sii164_check_interrupt(void);
+void sii164_clear_interrupt(void);
 #endif
 /*
  * below register definition is used for
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index c237a8f8eb59..9d642e8986a4 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -112,20 +112,20 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 	crtc = &par->crtc;
 	cursor = &crtc->cursor;
 
-	if (fbcursor->image.width > cursor->maxW ||
-	    fbcursor->image.height > cursor->maxH ||
+	if (fbcursor->image.width > cursor->max_w ||
+	    fbcursor->image.height > cursor->max_h ||
 	    fbcursor->image.depth > 1) {
 		return -ENXIO;
 	}
 
 	sm750_hw_cursor_disable(cursor);
 	if (fbcursor->set & FB_CUR_SETSIZE)
-		sm750_hw_cursor_setSize(cursor,
+		sm750_hw_cursor_set_size(cursor,
 					fbcursor->image.width,
 					fbcursor->image.height);
 
 	if (fbcursor->set & FB_CUR_SETPOS)
-		sm750_hw_cursor_setPos(cursor,
+		sm750_hw_cursor_set_pos(cursor,
 				       fbcursor->image.dx - info->var.xoffset,
 				       fbcursor->image.dy - info->var.yoffset);
 
@@ -141,11 +141,11 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 		     ((info->cmap.green[fbcursor->image.bg_color] & 0xfc00) >> 5) |
 		     ((info->cmap.blue[fbcursor->image.bg_color] & 0xf800) >> 11);
 
-		sm750_hw_cursor_setColor(cursor, fg, bg);
+		sm750_hw_cursor_set_color(cursor, fg, bg);
 	}
 
 	if (fbcursor->set & (FB_CUR_SETSHAPE | FB_CUR_SETIMAGE)) {
-		sm750_hw_cursor_setData(cursor,
+		sm750_hw_cursor_set_data(cursor,
 					fbcursor->rop,
 					fbcursor->image.data,
 					fbcursor->mask);
@@ -162,7 +162,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 {
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
-	unsigned int base, pitch, Bpp, rop;
+	unsigned int base, pitch, bpp, rop;
 	u32 color;
 
 	if (info->state != FBINFO_STATE_RUNNING)
@@ -175,11 +175,11 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	 * each time 2d function begin to work,below three variable always need
 	 * be set, seems we can put them together in some place
 	 */
-	base = par->crtc.oScreen;
+	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
-	color = (Bpp == 1) ? region->color :
+	color = (bpp == 1) ? region->color :
 		((u32 *)info->pseudo_palette)[region->color];
 	rop = (region->rop != ROP_COPY) ? HW_ROP2_XOR : HW_ROP2_COPY;
 
@@ -192,7 +192,7 @@ static void lynxfb_ops_fillrect(struct fb_info *info,
 	spin_lock(&sm750_dev->slock);
 
 	sm750_dev->accel.de_fillrect(&sm750_dev->accel,
-				     base, pitch, Bpp,
+				     base, pitch, bpp,
 				     region->dx, region->dy,
 				     region->width, region->height,
 				     color, rop);
@@ -204,7 +204,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 {
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
-	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 
 	par = info->par;
 	sm750_dev = par->dev;
@@ -213,9 +213,9 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 	 * each time 2d function begin to work,below three variable always need
 	 * be set, seems we can put them together in some place
 	 */
-	base = par->crtc.oScreen;
+	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
 	/*
 	 * If not use spin_lock, system will die if user load driver
@@ -227,7 +227,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 
 	sm750_dev->accel.de_copyarea(&sm750_dev->accel,
 				     base, pitch, region->sx, region->sy,
-				     base, pitch, Bpp, region->dx, region->dy,
+				     base, pitch, bpp, region->dx, region->dy,
 				     region->width, region->height,
 				     HW_ROP2_COPY);
 	spin_unlock(&sm750_dev->slock);
@@ -236,7 +236,7 @@ static void lynxfb_ops_copyarea(struct fb_info *info,
 static void lynxfb_ops_imageblit(struct fb_info *info,
 				 const struct fb_image *image)
 {
-	unsigned int base, pitch, Bpp;
+	unsigned int base, pitch, bpp;
 	unsigned int fgcol, bgcol;
 	struct lynxfb_par *par;
 	struct sm750_dev *sm750_dev;
@@ -247,9 +247,9 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 	 * each time 2d function begin to work,below three variable always need
 	 * be set, seems we can put them together in some place
 	 */
-	base = par->crtc.oScreen;
+	base = par->crtc.o_screen;
 	pitch = info->fix.line_length;
-	Bpp = info->var.bits_per_pixel >> 3;
+	bpp = info->var.bits_per_pixel >> 3;
 
 	/* TODO: Implement hardware acceleration for image->depth > 1 */
 	if (image->depth != 1) {
@@ -276,7 +276,7 @@ static void lynxfb_ops_imageblit(struct fb_info *info,
 
 	sm750_dev->accel.de_imageblit(&sm750_dev->accel,
 				      image->data, image->width >> 3, 0,
-				      base, pitch, Bpp,
+				      base, pitch, bpp,
 				      image->dx, image->dy,
 				      image->width, image->height,
 				      fgcol, bgcol, HW_ROP2_COPY);
@@ -393,9 +393,9 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 		pr_err("bpp %d not supported\n", var->bits_per_pixel);
 		return ret;
 	}
-	ret = hw_sm750_crtc_setMode(crtc, var, fix);
+	ret = hw_sm750_crtc_set_mode(crtc, var, fix);
 	if (!ret)
-		ret = hw_sm750_output_setMode(output, var, fix);
+		ret = hw_sm750_output_set_mode(output, var, fix);
 	return ret;
 }
 
@@ -451,7 +451,7 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
 		crtc = &par->crtc;
 		cursor = &crtc->cursor;
 		memset_io(cursor->vstart, 0x0, cursor->size);
-		memset_io(crtc->vScreen, 0x0, crtc->vidmem_size);
+		memset_io(crtc->v_screen, 0x0, crtc->vidmem_size);
 		lynxfb_ops_set_par(info);
 		fb_set_suspend(info, 0);
 	}
@@ -463,7 +463,7 @@ static int __maybe_unused lynxfb_resume(struct device *dev)
 		crtc = &par->crtc;
 		cursor = &crtc->cursor;
 		memset_io(cursor->vstart, 0x0, cursor->size);
-		memset_io(crtc->vScreen, 0x0, crtc->vidmem_size);
+		memset_io(crtc->v_screen, 0x0, crtc->vidmem_size);
 		lynxfb_ops_set_par(info);
 		fb_set_suspend(info, 0);
 	}
@@ -512,7 +512,7 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 		return -ENOMEM;
 	}
 
-	return hw_sm750_crtc_checkMode(crtc, var);
+	return hw_sm750_crtc_check_mode(crtc, var);
 }
 
 static int lynxfb_ops_setcolreg(unsigned int regno,
@@ -545,7 +545,7 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 		red >>= 8;
 		green >>= 8;
 		blue >>= 8;
-		ret = hw_sm750_setColReg(crtc, regno, red, green, blue);
+		ret = hw_sm750_set_col_reg(crtc, regno, red, green, blue);
 		goto exit;
 	}
 
@@ -577,7 +577,7 @@ static int lynxfb_ops_blank(int blank, struct fb_info *info)
 	pr_debug("blank = %d.\n", blank);
 	par = info->par;
 	output = &par->output;
-	return output->proc_setBLANK(output, blank);
+	return output->proc_set_blank(output, blank);
 }
 
 static int sm750fb_set_drv(struct lynxfb_par *par)
@@ -598,60 +598,60 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		crtc->vidmem_size >>= 1;
 
 	/* setup crtc and output member */
-	sm750_dev->hwCursor = g_hwcursor;
+	sm750_dev->hw_cursor = g_hwcursor;
 
 	crtc->line_pad = 16;
 	crtc->xpanstep = 8;
 	crtc->ypanstep = 1;
 	crtc->ywrapstep = 0;
 
-	output->proc_setBLANK = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				 hw_sm750le_setBLANK : hw_sm750_setBLANK;
+	output->proc_set_blank = (sm750_dev->revid == SM750LE_REVISION_ID) ?
+				 hw_sm750le_set_blank : hw_sm750_set_blank;
 	/* chip specific phase */
 	sm750_dev->accel.de_wait = (sm750_dev->revid == SM750LE_REVISION_ID) ?
-				    hw_sm750le_deWait : hw_sm750_deWait;
+				    hw_sm750le_de_wait : hw_sm750_de_wait;
 	switch (sm750_dev->dataflow) {
 	case sm750_simul_pri:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_primary;
-		crtc->oScreen = 0;
-		crtc->vScreen = sm750_dev->pvMem;
+		crtc->o_screen = 0;
+		crtc->v_screen = sm750_dev->pv_mem;
 		pr_info("use simul primary mode\n");
 		break;
 	case sm750_simul_sec:
 		output->paths = sm750_pnc;
 		crtc->channel = sm750_secondary;
-		crtc->oScreen = 0;
-		crtc->vScreen = sm750_dev->pvMem;
+		crtc->o_screen = 0;
+		crtc->v_screen = sm750_dev->pv_mem;
 		break;
 	case sm750_dual_normal:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_primary;
-			crtc->oScreen = 0;
-			crtc->vScreen = sm750_dev->pvMem;
+			crtc->o_screen = 0;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_secondary;
-			/* not consider of padding stuffs for oScreen,need fix */
-			crtc->oScreen = sm750_dev->vidmem_size >> 1;
-			crtc->vScreen = sm750_dev->pvMem + crtc->oScreen;
+			/* not consider of padding stuffs for o_screen,need fix */
+			crtc->o_screen = sm750_dev->vidmem_size >> 1;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	case sm750_dual_swap:
 		if (par->index == 0) {
 			output->paths = sm750_panel;
 			crtc->channel = sm750_secondary;
-			crtc->oScreen = 0;
-			crtc->vScreen = sm750_dev->pvMem;
+			crtc->o_screen = 0;
+			crtc->v_screen = sm750_dev->pv_mem;
 		} else {
 			output->paths = sm750_crt;
 			crtc->channel = sm750_primary;
-			/* not consider of padding stuffs for oScreen,
+			/* not consider of padding stuffs for o_screen,
 			 * need fix
 			 */
-			crtc->oScreen = sm750_dev->vidmem_size >> 1;
-			crtc->vScreen = sm750_dev->pvMem + crtc->oScreen;
+			crtc->o_screen = sm750_dev->vidmem_size >> 1;
+			crtc->v_screen = sm750_dev->pv_mem + crtc->o_screen;
 		}
 		break;
 	default:
@@ -694,7 +694,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		"kernel HELPERS prepared vesa_modes",
 	};
 
-	static const char *fixId[2] = {
+	static const char *fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
@@ -718,14 +718,14 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	 * set current cursor variable and proc pointer,
 	 * must be set after crtc member initialized
 	 */
-	crtc->cursor.offset = crtc->oScreen + crtc->vidmem_size - 1024;
-	crtc->cursor.mmio = sm750_dev->pvReg +
+	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
+	crtc->cursor.mmio = sm750_dev->pv_reg +
 		0x800f0 + (int)crtc->channel * 0x140;
 
 	pr_info("crtc->cursor.mmio = %p\n", crtc->cursor.mmio);
-	crtc->cursor.maxH = crtc->cursor.maxW = 64;
-	crtc->cursor.size = crtc->cursor.maxH * crtc->cursor.maxW * 2 / 8;
-	crtc->cursor.vstart = sm750_dev->pvMem + crtc->cursor.offset;
+	crtc->cursor.max_h = crtc->cursor.max_w = 64;
+	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
+	crtc->cursor.vstart = sm750_dev->pv_mem + crtc->cursor.offset;
 
 	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
 	if (!g_hwcursor) {
@@ -801,7 +801,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 			    crtc->line_pad);
 
 	info->pseudo_palette = &par->pseudo_palette[0];
-	info->screen_base = crtc->vScreen;
+	info->screen_base = crtc->v_screen;
 	pr_debug("screen_base vaddr = %p\n", info->screen_base);
 	info->screen_size = line_length * var->yres_virtual;
 	info->flags = FBINFO_FLAG_DEFAULT | 0;
@@ -814,9 +814,9 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 	fix->ywrapstep = crtc->ywrapstep;
 	fix->accel = FB_ACCEL_SMI;
 
-	strscpy(fix->id, fixId[index], sizeof(fix->id));
+	strscpy(fix->id, fix_id[index], sizeof(fix->id));
 
-	fix->smem_start = crtc->oScreen + sm750_dev->vidmem_start;
+	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
 	pr_info("fix->smem_start = %lx\n", fix->smem_start);
 	/*
 	 * according to mmap experiment from user space application,
@@ -870,12 +870,12 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 
 	swap = 0;
 
-	sm750_dev->initParm.chip_clk = 0;
-	sm750_dev->initParm.mem_clk = 0;
-	sm750_dev->initParm.master_clk = 0;
-	sm750_dev->initParm.powerMode = 0;
-	sm750_dev->initParm.setAllEngOff = 0;
-	sm750_dev->initParm.resetMemory = 1;
+	sm750_dev->init_param.chip_clk = 0;
+	sm750_dev->init_param.mem_clk = 0;
+	sm750_dev->init_param.master_clk = 0;
+	sm750_dev->init_param.power_mode = 0;
+	sm750_dev->init_param.set_all_eng_off = 0;
+	sm750_dev->init_param.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
@@ -894,9 +894,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
 			sm750_dev->nocrt = 1;
 		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
-			sm750_dev->pnltype = sm750_doubleTFT;
+			sm750_dev->pnltype = sm750_double_tft;
 		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
-			sm750_dev->pnltype = sm750_dualTFT;
+			sm750_dev->pnltype = sm750_dual_tft;
 		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
 			sm750_dev->pnltype = sm750_24TFT;
 		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
@@ -1061,7 +1061,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 		sm750_dev->mtrr.vram = arch_phys_wc_add(sm750_dev->vidmem_start,
 							sm750_dev->vidmem_size);
 
-	memset_io(sm750_dev->pvMem, 0, sm750_dev->vidmem_size);
+	memset_io(sm750_dev->pv_mem, 0, sm750_dev->vidmem_size);
 
 	pci_set_drvdata(pdev, sm750_dev);
 
@@ -1092,8 +1092,8 @@ static void lynxfb_pci_remove(struct pci_dev *pdev)
 	sm750fb_framebuffer_release(sm750_dev);
 	arch_phys_wc_del(sm750_dev->mtrr.vram);
 
-	iounmap(sm750_dev->pvReg);
-	iounmap(sm750_dev->pvMem);
+	iounmap(sm750_dev->pv_reg);
+	iounmap(sm750_dev->pv_mem);
 	kfree(g_settings);
 }
 
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 23eefd019ec9..b5b2d048e1a6 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -14,8 +14,8 @@
 
 enum sm750_pnltype {
 	sm750_24TFT = 0,	/* 24bit tft */
-	sm750_dualTFT = 2,	/* dual 18 bit tft */
-	sm750_doubleTFT = 1,	/* 36 bit double pixel tft */
+	sm750_dual_tft = 2,	/* dual 18 bit tft */
+	sm750_double_tft = 1,	/* 36 bit double pixel tft */
 };
 
 /* vga channel is not concerned  */
@@ -39,20 +39,20 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
 	/* base virtual address of DPR registers */
-	volatile unsigned char __iomem *dprBase;
+	volatile unsigned char __iomem *dpr_base;
 	/* base virtual address of de data port */
-	volatile unsigned char __iomem *dpPortBase;
+	volatile unsigned char __iomem *de_port_base;
 
 	/* function pointers */
 	void (*de_init)(struct lynx_accel *accel);
@@ -97,12 +97,12 @@ struct sm750_dev {
 	unsigned long vidreg_start;
 	__u32 vidmem_size;
 	__u32 vidreg_size;
-	void __iomem *pvReg;
-	unsigned char __iomem *pvMem;
+	void __iomem *pv_reg;
+	unsigned char __iomem *pv_mem;
 	/* locks*/
 	spinlock_t slock;
 
-	struct init_status initParm;
+	struct init_status init_param;
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
@@ -113,7 +113,7 @@ struct sm750_dev {
 	 * 2: secondary crtc hw cursor enabled
 	 * 3: both ctrc hw cursor enabled
 	 */
-	int hwCursor;
+	int hw_cursor;
 };
 
 struct lynx_cursor {
@@ -122,8 +122,8 @@ struct lynx_cursor {
 	int h;
 	int size;
 	/* hardware limitation */
-	int maxW;
-	int maxH;
+	int max_w;
+	int max_h;
 	/* base virtual address and offset  of cursor image */
 	char __iomem *vstart;
 	int offset;
@@ -132,10 +132,10 @@ struct lynx_cursor {
 };
 
 struct lynxfb_crtc {
-	unsigned char __iomem *vCursor; /* virtual address of cursor */
-	unsigned char __iomem *vScreen; /* virtual address of on_screen */
-	int oCursor; /* cursor address offset in vidmem */
-	int oScreen; /* onscreen address offset in vidmem */
+	unsigned char __iomem *v_cursor; /* virtual address of cursor */
+	unsigned char __iomem *v_screen; /* virtual address of on_screen */
+	int o_cursor; /* cursor address offset in vidmem */
+	int o_screen; /* onscreen address offset in vidmem */
 	int channel;/* which channel this crtc stands for*/
 	resource_size_t vidmem_size;/* this view's video memory max size */
 
@@ -170,7 +170,7 @@ struct lynxfb_output {
 	 */
 	void *priv;
 
-	int (*proc_setBLANK)(struct lynxfb_output *output, int blank);
+	int (*proc_set_blank)(struct lynxfb_output *output, int blank);
 };
 
 struct lynxfb_par {
@@ -193,26 +193,26 @@ static inline unsigned long ps_to_hz(unsigned int psvalue)
 
 int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
 int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev);
-void hw_sm750_initAccel(struct sm750_dev *sm750_dev);
-int hw_sm750_deWait(void);
-int hw_sm750le_deWait(void);
+void hw_sm750_init_accel(struct sm750_dev *sm750_dev);
+int hw_sm750_de_wait(void);
+int hw_sm750le_de_wait(void);
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
 			    struct fb_fix_screeninfo *fix);
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var);
 
-int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
 			  struct fb_fix_screeninfo *fix);
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 		       ushort red, ushort green, ushort blue);
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank);
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank);
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank);
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank);
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 			 const struct fb_var_screeninfo *var,
 			 const struct fb_info *info);
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 8faa601c700b..7b2944d38519 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -18,19 +18,19 @@
 
 #include "sm750.h"
 #include "sm750_accel.h"
-static inline void write_dpr(struct lynx_accel *accel, int offset, u32 regValue)
+static inline void write_dpr(struct lynx_accel *accel, int offset, u32 reg_value)
 {
-	writel(regValue, accel->dprBase + offset);
+	writel(reg_value, accel->dpr_base + offset);
 }
 
 static inline u32 read_dpr(struct lynx_accel *accel, int offset)
 {
-	return readl(accel->dprBase + offset);
+	return readl(accel->dpr_base + offset);
 }
 
-static inline void write_dpPort(struct lynx_accel *accel, u32 data)
+static inline void write_dp_port(struct lynx_accel *accel, u32 data)
 {
-	writel(data, accel->dpPortBase);
+	writel(data, accel->de_port_base);
 }
 
 void sm750_hw_de_init(struct lynx_accel *accel)
@@ -86,11 +86,11 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt)
 }
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop)
 {
-	u32 deCtrl;
+	u32 de_ctrl;
 
 	if (accel->de_wait() != 0) {
 		/*
@@ -103,14 +103,14 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
 	write_dpr(accel, DE_PITCH,
-		  ((pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		   (pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
+		   (pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr44 */
 
 	write_dpr(accel, DE_FOREGROUND, color); /* DPR14 */
 
@@ -122,23 +122,23 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		  ((width << DE_DIMENSION_X_SHIFT) & DE_DIMENSION_X_MASK) |
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr8 */
 
-	deCtrl = DE_CONTROL_STATUS | DE_CONTROL_LAST_PIXEL |
+	de_ctrl = DE_CONTROL_STATUS | DE_CONTROL_LAST_PIXEL |
 		DE_CONTROL_COMMAND_RECTANGLE_FILL | DE_CONTROL_ROP_SELECT |
 		(rop & DE_CONTROL_ROP_MASK); /* dpr0xc */
 
-	write_dpr(accel, DE_CONTROL, deCtrl);
+	write_dpr(accel, DE_CONTROL, de_ctrl);
 	return 0;
 }
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @s_base: Address of source: offset in frame buffer
+ * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -146,21 +146,21 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int d_base, unsigned int d_pitch,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int n_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	n_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (sBase == dBase && sPitch == dPitch) {
+	if (s_base == d_base && s_pitch == d_pitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			n_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			n_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				n_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				n_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -234,14 +234,14 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_SOURCE_BASE, sBase); /* dpr40 */
+	write_dpr(accel, DE_WINDOW_SOURCE_BASE, s_base); /* dpr40 */
 
 	/*
 	 * 2D Destination Base.
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase); /* dpr44 */
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base); /* dpr44 */
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent lines).
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((d_pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (sPitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (s_pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((d_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (sPitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (s_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
@@ -277,14 +277,14 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
 	return 0;
 }
 
-static unsigned int deGetTransparency(struct lynx_accel *accel)
+static unsigned int de_get_transparency(struct lynx_accel *accel)
 {
 	unsigned int de_ctrl;
 
@@ -298,38 +298,38 @@ static unsigned int deGetTransparency(struct lynx_accel *accel)
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
+ * @p_src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *	      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
  *	      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @byte_per_pixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
+ * @f_color: Foreground color (corresponding to a 1 in the monochrome data
+ * @b_color: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2)
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *p_src_buf,
+		       u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 f_color, u32 b_color, u32 rop2)
 {
-	unsigned int ulBytesPerScan;
-	unsigned int ul4BytesPerScan;
-	unsigned int ulBytesRemain;
+	unsigned int ul_bytes_per_scan;
+	unsigned int ul4_bytes_per_scan;
+	unsigned int ul_bytes_remain;
 	unsigned int de_ctrl = 0;
-	unsigned char ajRemain[4];
+	unsigned char aj_remain[4];
 	int i, j;
 
-	startBit &= 7; /* Just make sure the start bit is within legal range */
-	ulBytesPerScan = (width + startBit + 7) / 8;
-	ul4BytesPerScan = ulBytesPerScan & ~3;
-	ulBytesRemain = ulBytesPerScan & 3;
+	start_bit &= 7; /* Just make sure the start bit is within legal range */
+	ul_bytes_per_scan = (width + start_bit + 7) / 8;
+	ul4_bytes_per_scan = ul_bytes_per_scan & ~3;
+	ul_bytes_remain = ul_bytes_per_scan & 3;
 
 	if (accel->de_wait() != 0)
 		return -1;
@@ -344,7 +344,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase);
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base);
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent
@@ -352,9 +352,9 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * register uses pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / bytePerPixel << DE_PITCH_DESTINATION_SHIFT) &
+		  ((d_pitch / byte_per_pixel << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (dPitch / bytePerPixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (d_pitch / byte_per_pixel & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -362,17 +362,17 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * in frame buffer for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / bytePerPixel << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((d_pitch / byte_per_pixel << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (dPitch / bytePerPixel & DE_WINDOW_WIDTH_SRC_MASK));
+		  (d_pitch / byte_per_pixel & DE_WINDOW_WIDTH_SRC_MASK));
 
 	 /*
 	  * Note: For 2D Source in Host Write, only X_K1_MONO field is needed,
 	  * and Y_K2 field is not used.
-	  * For mono bitmap, use startBit for X_K1.
+	  * For mono bitmap, use start_bit for X_K1.
 	  */
 	write_dpr(accel, DE_SOURCE,
-		  (startBit << DE_SOURCE_X_K1_SHIFT) &
+		  (start_bit << DE_SOURCE_X_K1_SHIFT) &
 		  DE_SOURCE_X_K1_MONO_MASK); /* dpr00 */
 
 	write_dpr(accel, DE_DESTINATION,
@@ -383,28 +383,28 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 		  ((width << DE_DIMENSION_X_SHIFT) & DE_DIMENSION_X_MASK) |
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
-	write_dpr(accel, DE_FOREGROUND, fColor);
-	write_dpr(accel, DE_BACKGROUND, bColor);
+	write_dpr(accel, DE_FOREGROUND, f_color);
+	write_dpr(accel, DE_BACKGROUND, b_color);
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) |
 		DE_CONTROL_ROP_SELECT | DE_CONTROL_COMMAND_HOST_WRITE |
 		DE_CONTROL_HOST | DE_CONTROL_STATUS;
 
-	write_dpr(accel, DE_CONTROL, de_ctrl | deGetTransparency(accel));
+	write_dpr(accel, DE_CONTROL, de_ctrl | de_get_transparency(accel));
 
 	/* Write MONO data (line by line) to 2D Engine data port */
 	for (i = 0; i < height; i++) {
 		/* For each line, send the data in chunks of 4 bytes */
-		for (j = 0; j < (ul4BytesPerScan / 4); j++)
-			write_dpPort(accel, *(unsigned int *)(pSrcbuf + (j * 4)));
+		for (j = 0; j < (ul4_bytes_per_scan / 4); j++)
+			write_dp_port(accel, *(unsigned int *)(p_src_buf + (j * 4)));
 
-		if (ulBytesRemain) {
-			memcpy(ajRemain, pSrcbuf + ul4BytesPerScan,
-			       ulBytesRemain);
-			write_dpPort(accel, *(unsigned int *)ajRemain);
+		if (ul_bytes_remain) {
+			memcpy(aj_remain, p_src_buf + ul4_bytes_per_scan,
+			       ul_bytes_remain);
+			write_dp_port(accel, *(unsigned int *)aj_remain);
 		}
 
-		pSrcbuf += srcDelta;
+		p_src_buf += src_delta;
 	}
 
 	return 0;
diff --git a/drivers/staging/sm750fb/sm750_accel.h b/drivers/staging/sm750fb/sm750_accel.h
index 2c79cb730a0a..d146b82818f1 100644
--- a/drivers/staging/sm750fb/sm750_accel.h
+++ b/drivers/staging/sm750fb/sm750_accel.h
@@ -190,19 +190,19 @@ void sm750_hw_set2dformat(struct lynx_accel *accel, int fmt);
 void sm750_hw_de_init(struct lynx_accel *accel);
 
 int sm750_hw_fillrect(struct lynx_accel *accel,
-		      u32 base, u32 pitch, u32 Bpp,
+		      u32 base, u32 pitch, u32 bpp,
 		      u32 x, u32 y, u32 width, u32 height,
 		      u32 color, u32 rop);
 
 /**
  * sm750_hm_copyarea
- * @sBase: Address of source: offset in frame buffer
- * @sPitch: Pitch value of source surface in BYTE
+ * @s_base: Address of source: offset in frame buffer
+ * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -210,34 +210,34 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @rop2: ROP value
  */
 int sm750_hw_copyarea(struct lynx_accel *accel,
-		      unsigned int sBase, unsigned int sPitch,
+		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int d_base, unsigned int d_pitch,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2);
 
 /**
  * sm750_hw_imageblit
- * @pSrcbuf: pointer to start of source buffer in system memory
- * @srcDelta: Pitch value (in bytes) of the source buffer, +ive means top down
+ * @p_src_buf: pointer to start of source buffer in system memory
+ * @src_delta: Pitch value (in bytes) of the source buffer, +ive means top down
  *>-----      and -ive mean button up
- * @startBit: Mono data can start at any bit in a byte, this value should be
+ * @start_bit: Mono data can start at any bit in a byte, this value should be
  *>-----      0 to 7
- * @dBase: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
- * @bytePerPixel: Color depth of destination surface
+ * @d_base: Address of destination: offset in frame buffer
+ * @d_pitch: Pitch value of destination surface in BYTE
+ * @byte_per_pixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
  * @height: height of rectangle in pixel value
- * @fColor: Foreground color (corresponding to a 1 in the monochrome data
- * @bColor: Background color (corresponding to a 0 in the monochrome data
+ * @f_color: Foreground color (corresponding to a 1 in the monochrome data
+ * @b_color: Background color (corresponding to a 0 in the monochrome data
  * @rop2: ROP value
  */
-int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
-		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
-		       u32 height, u32 fColor, u32 bColor, u32 rop2);
+int sm750_hw_imageblit(struct lynx_accel *accel, const char *p_src_buf,
+		       u32 src_delta, u32 start_bit, u32 d_base, u32 d_pitch,
+		       u32 byte_per_pixel, u32 dx, u32 dy, u32 width,
+		       u32 height, u32 f_color, u32 b_color, u32 rop2);
 
 #endif
diff --git a/drivers/staging/sm750fb/sm750_cursor.c b/drivers/staging/sm750fb/sm750_cursor.c
index bbbef27cb329..3ee3bf78f7a5 100644
--- a/drivers/staging/sm750fb/sm750_cursor.c
+++ b/drivers/staging/sm750fb/sm750_cursor.c
@@ -58,13 +58,13 @@ void sm750_hw_cursor_disable(struct lynx_cursor *cursor)
 	poke32(HWC_ADDRESS, 0);
 }
 
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h)
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h)
 {
 	cursor->w = w;
 	cursor->h = h;
 }
 
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y)
 {
 	u32 reg;
 
@@ -73,7 +73,7 @@ void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y)
 	poke32(HWC_LOCATION, reg);
 }
 
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg)
 {
 	u32 reg = (fg << HWC_COLOR_12_2_RGB565_SHIFT) &
 		HWC_COLOR_12_2_RGB565_MASK;
@@ -82,7 +82,7 @@ void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg)
 	poke32(HWC_COLOR_3, 0xffe0);
 }
 
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
@@ -97,7 +97,7 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 	count = pitch * cursor->h;
 
 	/* in byte */
-	offset = cursor->maxW * 2 / 8;
+	offset = cursor->max_w * 2 / 8;
 
 	data = 0;
 	pstart = cursor->vstart;
@@ -132,7 +132,7 @@ void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
 	}
 }
 
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *pcol, const u8 *pmsk)
 {
 	int i, j, count, pitch, offset;
@@ -147,7 +147,7 @@ void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
 	count = pitch * cursor->h;
 
 	/* in byte */
-	offset = cursor->maxW * 2 / 8;
+	offset = cursor->max_w * 2 / 8;
 
 	data = 0;
 	pstart = cursor->vstart;
diff --git a/drivers/staging/sm750fb/sm750_cursor.h b/drivers/staging/sm750fb/sm750_cursor.h
index b59643dd61ed..8a1e81b8248d 100644
--- a/drivers/staging/sm750fb/sm750_cursor.h
+++ b/drivers/staging/sm750fb/sm750_cursor.h
@@ -5,11 +5,11 @@
 /* hw_cursor_xxx works for voyager,718 and 750 */
 void sm750_hw_cursor_enable(struct lynx_cursor *cursor);
 void sm750_hw_cursor_disable(struct lynx_cursor *cursor);
-void sm750_hw_cursor_setSize(struct lynx_cursor *cursor, int w, int h);
-void sm750_hw_cursor_setPos(struct lynx_cursor *cursor, int x, int y);
-void sm750_hw_cursor_setColor(struct lynx_cursor *cursor, u32 fg, u32 bg);
-void sm750_hw_cursor_setData(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_size(struct lynx_cursor *cursor, int w, int h);
+void sm750_hw_cursor_set_pos(struct lynx_cursor *cursor, int x, int y);
+void sm750_hw_cursor_set_color(struct lynx_cursor *cursor, u32 fg, u32 bg);
+void sm750_hw_cursor_set_data(struct lynx_cursor *cursor, u16 rop,
 			     const u8 *data, const u8 *mask);
-void sm750_hw_cursor_setData2(struct lynx_cursor *cursor, u16 rop,
+void sm750_hw_cursor_set_data2(struct lynx_cursor *cursor, u16 rop,
 			      const u8 *data, const u8 *mask);
 #endif
diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index 7136d751cff5..dc95b3a62ec1 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -50,20 +50,20 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	}
 
 	/* now map mmio and vidmem */
-	sm750_dev->pvReg = ioremap(sm750_dev->vidreg_start,
+	sm750_dev->pv_reg = ioremap(sm750_dev->vidreg_start,
 				   sm750_dev->vidreg_size);
-	if (!sm750_dev->pvReg) {
+	if (!sm750_dev->pv_reg) {
 		pr_err("mmio failed\n");
 		ret = -EFAULT;
 		goto exit;
 	} else {
-		pr_info("mmio virtual addr = %p\n", sm750_dev->pvReg);
+		pr_info("mmio virtual addr = %p\n", sm750_dev->pv_reg);
 	}
 
-	sm750_dev->accel.dprBase = sm750_dev->pvReg + DE_BASE_ADDR_TYPE1;
-	sm750_dev->accel.dpPortBase = sm750_dev->pvReg + DE_PORT_ADDR_TYPE1;
+	sm750_dev->accel.dpr_base = sm750_dev->pv_reg + DE_BASE_ADDR_TYPE1;
+	sm750_dev->accel.de_port_base = sm750_dev->pv_reg + DE_PORT_ADDR_TYPE1;
 
-	mmio750 = sm750_dev->pvReg;
+	mmio750 = sm750_dev->pv_reg;
 	sm750_set_chip_type(sm750_dev->devid, sm750_dev->revid);
 
 	sm750_dev->vidmem_start = pci_resource_start(pdev, 0);
@@ -78,14 +78,14 @@ int hw_sm750_map(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		sm750_dev->vidmem_start, sm750_dev->vidmem_size);
 
 	/* reserve the vidmem space of smi adaptor */
-	sm750_dev->pvMem = ioremap_wc(sm750_dev->vidmem_start,
+	sm750_dev->pv_mem = ioremap_wc(sm750_dev->vidmem_start,
 				      sm750_dev->vidmem_size);
-	if (!sm750_dev->pvMem) {
+	if (!sm750_dev->pv_mem) {
 		pr_err("Map video memory failed\n");
 		ret = -EFAULT;
 		goto exit;
 	} else {
-		pr_info("video memory vaddr = %p\n", sm750_dev->pvMem);
+		pr_info("video memory vaddr = %p\n", sm750_dev->pv_mem);
 	}
 exit:
 	return ret;
@@ -95,7 +95,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 {
 	struct init_status *parm;
 
-	parm = &sm750_dev->initParm;
+	parm = &sm750_dev->init_param;
 	if (parm->chip_clk == 0)
 		parm->chip_clk = (sm750_get_chip_type() == SM750LE) ?
 						DEFAULT_SM750LE_CHIP_CLOCK :
@@ -106,7 +106,7 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 	if (parm->master_clk == 0)
 		parm->master_clk = parm->chip_clk / 3;
 
-	ddk750_init_hw((struct initchip_param *)&sm750_dev->initParm);
+	ddk750_init_hw((struct initchip_param *)&sm750_dev->init_param);
 	/* for sm718, open pci burst */
 	if (sm750_dev->devid == 0x718) {
 		poke32(SYSTEM_CTRL,
@@ -138,10 +138,10 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 		switch (sm750_dev->pnltype) {
 		case sm750_24TFT:
 			break;
-		case sm750_doubleTFT:
+		case sm750_double_tft:
 			val |= PANEL_DISPLAY_CTRL_DOUBLE_PIXEL;
 			break;
-		case sm750_dualTFT:
+		case sm750_dual_tft:
 			val |= PANEL_DISPLAY_CTRL_DUAL_DISPLAY;
 			break;
 		}
@@ -175,12 +175,12 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
 
 	/* init 2d engine */
 	if (!sm750_dev->accel_off)
-		hw_sm750_initAccel(sm750_dev);
+		hw_sm750_init_accel(sm750_dev);
 
 	return 0;
 }
 
-int hw_sm750_output_setMode(struct lynxfb_output *output,
+int hw_sm750_output_set_mode(struct lynxfb_output *output,
 			    struct fb_var_screeninfo *var,
 			    struct fb_fix_screeninfo *fix)
 {
@@ -221,7 +221,7 @@ int hw_sm750_output_setMode(struct lynxfb_output *output,
 	return ret;
 }
 
-int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_check_mode(struct lynxfb_crtc *crtc,
 			    struct fb_var_screeninfo *var)
 {
 	struct sm750_dev *sm750_dev;
@@ -247,7 +247,7 @@ int hw_sm750_crtc_checkMode(struct lynxfb_crtc *crtc,
 }
 
 /* set the controller's mode for @crtc charged with @var and @fix parameters */
-int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
+int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 			  struct fb_var_screeninfo *var,
 			  struct fb_fix_screeninfo *fix)
 {
@@ -305,7 +305,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 		clock = SECONDARY_PLL;
 
 	pr_debug("Request pixel clock = %lu\n", modparm.pixel_clock);
-	ret = ddk750_setModeTiming(&modparm, clock);
+	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		pr_err("Set mode timing failed\n");
 		goto exit;
@@ -314,7 +314,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 	if (crtc->channel != sm750_secondary) {
 		/* set pitch, offset, width, start address, etc... */
 		poke32(PANEL_FB_ADDRESS,
-		       crtc->oScreen & PANEL_FB_ADDRESS_ADDRESS_MASK);
+		       crtc->o_screen & PANEL_FB_ADDRESS_ADDRESS_MASK);
 
 		reg = var->xres * (var->bits_per_pixel >> 3);
 		/*
@@ -350,7 +350,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 		poke32(PANEL_DISPLAY_CTRL, reg | (var->bits_per_pixel >> 4));
 	} else {
 		/* not implemented now */
-		poke32(CRT_FB_ADDRESS, crtc->oScreen);
+		poke32(CRT_FB_ADDRESS, crtc->o_screen);
 		reg = var->xres * (var->bits_per_pixel >> 3);
 		/*
 		 * crtc->channel is not equal to par->index on numeric,
@@ -372,7 +372,7 @@ int hw_sm750_crtc_setMode(struct lynxfb_crtc *crtc,
 	return ret;
 }
 
-int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
+int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index,
 		       ushort red, ushort green, ushort blue)
 {
 	static unsigned int add[] = {PANEL_PALETTE_RAM, CRT_PALETTE_RAM};
@@ -382,7 +382,7 @@ int hw_sm750_setColReg(struct lynxfb_crtc *crtc, ushort index,
 	return 0;
 }
 
-int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750le_set_blank(struct lynxfb_output *output, int blank)
 {
 	int dpms, crtdb;
 
@@ -423,7 +423,7 @@ int hw_sm750le_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
+int hw_sm750_set_blank(struct lynxfb_output *output, int blank)
 {
 	unsigned int dpms, pps, crtdb;
 
@@ -476,7 +476,7 @@ int hw_sm750_setBLANK(struct lynxfb_output *output, int blank)
 	return 0;
 }
 
-void hw_sm750_initAccel(struct sm750_dev *sm750_dev)
+void hw_sm750_init_accel(struct sm750_dev *sm750_dev)
 {
 	u32 reg;
 
@@ -506,7 +506,7 @@ void hw_sm750_initAccel(struct sm750_dev *sm750_dev)
 	sm750_dev->accel.de_init(&sm750_dev->accel);
 }
 
-int hw_sm750le_deWait(void)
+int hw_sm750le_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = DE_STATE2_DE_STATUS_BUSY | DE_STATE2_DE_FIFO_EMPTY |
@@ -523,7 +523,7 @@ int hw_sm750le_deWait(void)
 	return -1;
 }
 
-int hw_sm750_deWait(void)
+int hw_sm750_de_wait(void)
 {
 	int i = 0x10000000;
 	unsigned int mask = SYSTEM_CTRL_DE_STATUS_BUSY |
@@ -554,7 +554,7 @@ int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
 
 	total = var->yoffset * info->fix.line_length +
 		((var->xoffset * var->bits_per_pixel) >> 3);
-	total += crtc->oScreen;
+	total += crtc->o_screen;
 	if (crtc->channel == sm750_primary) {
 		poke32(PANEL_FB_ADDRESS,
 		       peek32(PANEL_FB_ADDRESS) |
-- 
2.30.2

