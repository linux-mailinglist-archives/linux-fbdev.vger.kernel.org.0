Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32370486255
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Jan 2022 10:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237538AbiAFJtN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 6 Jan 2022 04:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237370AbiAFJtN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 6 Jan 2022 04:49:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55E0C061245;
        Thu,  6 Jan 2022 01:49:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9EF47B81FF3;
        Thu,  6 Jan 2022 09:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F4C36AED;
        Thu,  6 Jan 2022 09:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641462550;
        bh=7ejwUR9khVOjvQTZ+7t0xh+E3D7/OAI8BpAO2s7ThFg=;
        h=From:To:Cc:Subject:Date:From;
        b=2Foe+lNDoAeCr2DYY0gxvT80gvfSo3yBN3fIzCbdSbN0dsS5Uyu8TKi0xI0MnEe+W
         2YMgGXsxp3yEZ0kMFivtCHowRkuUvOnmHT7u/+w5et7hWvZJ1K7fmElADmhheec2qp
         bCTKD86u7kP1NkekSnRuq90FybO/90tJ7+MK3TDQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH] omapfb: use default_groups in kobj_type
Date:   Thu,  6 Jan 2022 10:49:06 +0100
Message-Id: <20220106094906.3272287-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3322; h=from:subject; bh=7ejwUR9khVOjvQTZ+7t0xh+E3D7/OAI8BpAO2s7ThFg=; b=owGbwMvMwCRo6H6F97bub03G02pJDInXdgs4/CgV3/D1Z8vNd80Rn0qMzpzI5G5YNt0mvyGS18dv zSP1jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZhIdRXDgsatMe/vyWVHFHSETVI1ff 7ZZ87bEIbZLFPkL8WxJb7ew7Zncr/zNs2fCcsvAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the omapfb sysfs code to use default_groups field which has
been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: linux-omap@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c | 3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
index 6dbe265b312d..f43394d52ba2 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
@@ -265,6 +265,7 @@ static struct attribute *display_sysfs_attrs[] = {
 	&display_attr_wss.attr,
 	NULL
 };
+ATTRIBUTE_GROUPS(display_sysfs);
 
 static ssize_t display_attr_show(struct kobject *kobj, struct attribute *attr,
 		char *buf)
@@ -303,7 +304,7 @@ static const struct sysfs_ops display_sysfs_ops = {
 
 static struct kobj_type display_ktype = {
 	.sysfs_ops = &display_sysfs_ops,
-	.default_attrs = display_sysfs_attrs,
+	.default_groups = display_sysfs_groups,
 };
 
 int display_init_sysfs(struct platform_device *pdev)
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
index b52cc1af0959..3addbcfdad87 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
@@ -457,6 +457,7 @@ static struct attribute *manager_sysfs_attrs[] = {
 	&manager_attr_cpr_coef.attr,
 	NULL
 };
+ATTRIBUTE_GROUPS(manager_sysfs);
 
 static ssize_t manager_attr_show(struct kobject *kobj, struct attribute *attr,
 		char *buf)
@@ -495,7 +496,7 @@ static const struct sysfs_ops manager_sysfs_ops = {
 
 static struct kobj_type manager_ktype = {
 	.sysfs_ops = &manager_sysfs_ops,
-	.default_attrs = manager_sysfs_attrs,
+	.default_groups = manager_sysfs_groups,
 };
 
 int dss_manager_kobj_init(struct omap_overlay_manager *mgr,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
index 36acf366213a..26644a108180 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
@@ -390,6 +390,7 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&overlay_attr_zorder.attr,
 	NULL
 };
+ATTRIBUTE_GROUPS(overlay_sysfs);
 
 static ssize_t overlay_attr_show(struct kobject *kobj, struct attribute *attr,
 		char *buf)
@@ -428,7 +429,7 @@ static const struct sysfs_ops overlay_sysfs_ops = {
 
 static struct kobj_type overlay_ktype = {
 	.sysfs_ops = &overlay_sysfs_ops,
-	.default_attrs = overlay_sysfs_attrs,
+	.default_groups = overlay_sysfs_groups,
 };
 
 int dss_overlay_kobj_init(struct omap_overlay *ovl,
-- 
2.34.1

