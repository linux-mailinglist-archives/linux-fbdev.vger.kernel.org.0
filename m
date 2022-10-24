Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD29960A23A
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Oct 2022 13:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbiJXLju (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Oct 2022 07:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231395AbiJXLjJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Oct 2022 07:39:09 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6176D864
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 04:38:31 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id v81so4517375vkv.5
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Oct 2022 04:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAyFJiVGXrC/KZsleNIpi2nk4bcxYAI8Wjviz1KFor4=;
        b=ZPJNNmG2CfyinfqrhsHlV+g/2spcGsRR6OA3gQWYXOOaD6Gsxx/0ZTZ/2WSEOwyYxr
         EDCpJh40XMtG2OTdgXJL02/X5omijLCV9JB2NHXHkDrLv9wNx5a9fXGjfKUy3F0lhTEe
         hmnXBdrKvxVeJ2M5hNGsU2bRRaZU/yeF/d2yhPBZ/vbo5qMU7Pf/Zeu4xzQd/tILMGUf
         9wVa7xUimRQsMhs8I2ooWhyIiW91jtGl8d73AU5DZCPbAW2aJV7S8knDGzccvSCFIAGK
         XYYnZNcK+zvSZs4S+oTEJp9GvLNjfNv3+EpEB1BBZw+e91dYFNlfBeXNg4N+ATQRyNH9
         j2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAyFJiVGXrC/KZsleNIpi2nk4bcxYAI8Wjviz1KFor4=;
        b=xMtqfV88cyTKDpmAm8Hp6PXIAN2VqZEy+/dBizURCmY+CM1TvkiVXK9H5UOmM/p+lM
         2KzujOKO3qeyAhyBVN19accVG3e/rr4MV1xCVxSTHcuT7BnT8NCnJqV1Sajx5yO+18kZ
         jwTe6idGmlnKbu49lhUNxdKixgWh9Ey5XoE+grDVYFq37zT8t9uCQ0B8UqxuCUMGNJcl
         8A72ZpFDEOeJjPJq0nOIHPErcz1PfmO5VvGbpmwBYc/yKGC9SykwGKCmQG0REddtQmAn
         DqnRCGy64csBGAesV4af+KTiNvcZBZ8/dOwMI5Ghnz2nWJmRFpfqldJn4TuXYS+aFujb
         RukA==
X-Gm-Message-State: ACrzQf3SoloVzeSZF9/SvPHlTTbPM52eU0Khp/D3OfPhZYnIs8cV7Fan
        v4nInEOLgMbi+UNW+JLALTuiR7/POCH8CyNf
X-Google-Smtp-Source: AMsMyM7j6rudLQ3oDGLiRJvO3ouLKzXkm11wgePZ/bzYxd0/dczcHVPABhvm+nv5ewjBPX37znVsPw==
X-Received: by 2002:a17:903:1c6:b0:185:47ce:f4f0 with SMTP id e6-20020a17090301c600b0018547cef4f0mr33699248plh.132.1666611442110;
        Mon, 24 Oct 2022 04:37:22 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:37:21 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 12/22] platform/x86: msi-wmi: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:35:03 +0900
Message-Id: <20221024113513.5205-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/msi-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index fd318cdfe313..3a74f0135fae 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -309,7 +309,7 @@ static int __init msi_wmi_init(void)
 	}
 
 	if (wmi_has_guid(MSIWMI_BIOS_GUID) &&
-	    acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	    (acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		err = msi_wmi_backlight_setup();
 		if (err) {
 			pr_err("Unable to setup backlight device\n");
-- 
2.37.3

