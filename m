Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A3444DF14
	for <lists+linux-fbdev@lfdr.de>; Fri, 12 Nov 2021 01:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbhKLAaV (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 Nov 2021 19:30:21 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:38181 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234597AbhKLAaH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 Nov 2021 19:30:07 -0500
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 84079203C9;
        Fri, 12 Nov 2021 01:27:15 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [RESEND PATCH v2 07/13] backlight: qcom-wled: Provide enabled_strings default for WLED 4 and 5
Date:   Fri, 12 Nov 2021 01:27:00 +0100
Message-Id: <20211112002706.453289-8-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112002706.453289-1-marijn.suijten@somainline.org>
References: <20211112002706.453289-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Only WLED 3 sets a sensible default that allows operating this driver
with just qcom,num-strings in the DT; WLED 4 and 5 require
qcom,enabled-strings to be provided otherwise enabled_strings remains
zero-initialized, resuling in every string-specific register write
(currently only the setup and config functions, brightness follows in a
future patch) to only configure the zero'th string multiple times.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index c342cd8440e1..a8fb8f19922d 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1077,6 +1077,7 @@ static const struct wled_config wled4_config_defaults = {
 	.cabc = false,
 	.external_pfet = false,
 	.auto_detection_enabled = false,
+	.enabled_strings = {0, 1, 2, 3},
 };

 static int wled5_setup(struct wled *wled)
@@ -1190,6 +1191,7 @@ static const struct wled_config wled5_config_defaults = {
 	.cabc = false,
 	.external_pfet = false,
 	.auto_detection_enabled = false,
+	.enabled_strings = {0, 1, 2, 3},
 };

 static const u32 wled3_boost_i_limit_values[] = {
--
2.33.0

