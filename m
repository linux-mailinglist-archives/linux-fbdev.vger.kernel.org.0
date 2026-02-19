Return-Path: <linux-fbdev+bounces-6304-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H7gEBmGl2n3zgIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6304-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 22:52:25 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9055162F5F
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 22:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E161B30089AC
	for <lists+linux-fbdev@lfdr.de>; Thu, 19 Feb 2026 21:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C7A3064A0;
	Thu, 19 Feb 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="zclDTJHm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838FF29B79B;
	Thu, 19 Feb 2026 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771537941; cv=none; b=fakllQxOP9eaXiy2NwPWvezzVjnTeYvessdrCe+gv2vRW0SRVUEHCQPU+6AbC+FFGnJsvn2iG/TZeYUKA7SaudjDZ5p8jRU9jdbiqxtTAvr1SK7DVv1D6J3SK2Vw4HKg7vY2IHG+Pl29fqnTVS/JhX5bk84x+6nkdzbB+hz3McM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771537941; c=relaxed/simple;
	bh=XRpiSvFPXT7r9aov8PdESQj7DYKdiA7e2jDzkvAPRiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9X+zJ9dZQraGPdWqCzhijskK80nJ2S9XgFJp9Z/TWGwc3SXXgFKC0gvGBBjk/1SBissXaM8W8tDjYhe6evo+Px0NPo7Dgfx5H8AbV21o8HVeBYChoR9faP/DzXt+Td5DqyvHsA0r1FPyRnribaL9t5JyERlqI0p33fE2JP9OzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=zclDTJHm; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=kMl37oK2w+vYUAZ8lrB8sak304qneVWgo5V/NQRfIxM=; b=zclDTJHm9HY3owp77OefNgHZHY
	WAJnyEzxFyTPyzbIcDKU+4mkBVT5pwS0fiO5lvyRt5t1V2KlyYPOQY4QjHAbKL7zC6ntrBwsSDLjD
	y1mi5osRfQV/vnV2CCemeqoeC2G3AX9X3V5OHni5HeeuJEdQBnIdepymvokymVgHo1x0WXLrdHAzu
	BpDzoMlQqOX0QAltzPNqCyDNrMYaA95L7U0SV59P/VrHAjRdaRos5oi1WSSGD6TCJTGpHSYsoeVu0
	CINL28DBUdaQ3nBKP9e4Ji9HNGDe3gukvixABysVA77/icwOXFgtA58KbYWw6TufxYVIcZg1nuN+/
	3w5C7E7Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBwT-0000000C71G-0u9V;
	Thu, 19 Feb 2026 21:52:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2] gpu: ipu-v3: clean up kernel-doc warnings
Date: Thu, 19 Feb 2026 13:52:11 -0800
Message-ID: <20260219215211.459108-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,pengutronix.de,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.linux.dev,lists.infradead.org,gmx.de,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6304-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,infradead.org:email,gmx.de:email,pengutronix.de:email,linux.dev:email,intel.com:email]
X-Rspamd-Queue-Id: D9055162F5F
X-Rspamd-Action: no action

Correct all kernel-doc warnings:
- fix a typedef kernel-doc comment
- mark a list_head as private
- use Returns: for function return values

Warning: include/video/imx-ipu-image-convert.h:31 struct member 'list' not
 described in 'ipu_image_convert_run'
Warning: include/video/imx-ipu-image-convert.h:40 function parameter
 'ipu_image_convert_cb_t' not described in 'void'
Warning: include/video/imx-ipu-image-convert.h:40 expecting prototype for
 ipu_image_convert_cb_t(). Prototype was for void() instead
Warning: include/video/imx-ipu-image-convert.h:66 No description found for
 return value of 'ipu_image_convert_verify'
Warning: include/video/imx-ipu-image-convert.h:90 No description found for
 return value of 'ipu_image_convert_prepare'
Warning: include/video/imx-ipu-image-convert.h:125 No description found for
 return value of 'ipu_image_convert_queue'
Warning: include/video/imx-ipu-image-convert.h:163 No description found for
 return value of 'ipu_image_convert'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2: add Reviewed-by, update Cc: list, rebase, resend

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org

 include/video/imx-ipu-image-convert.h |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--- linux-next-20260218.orig/include/video/imx-ipu-image-convert.h
+++ linux-next-20260218/include/video/imx-ipu-image-convert.h
@@ -27,12 +27,13 @@ struct ipu_image_convert_run {
 
 	int status;
 
+	/* private: */
 	/* internal to image converter, callers don't touch */
 	struct list_head list;
 };
 
 /**
- * ipu_image_convert_cb_t - conversion callback function prototype
+ * typedef ipu_image_convert_cb_t - conversion callback function prototype
  *
  * @run:	the completed conversion run pointer
  * @ctx:	a private context pointer for the callback
@@ -60,7 +61,7 @@ void ipu_image_convert_adjust(struct ipu
  * @out:	output image format
  * @rot_mode:	rotation mode
  *
- * Returns 0 if the formats and rotation mode meet IPU restrictions,
+ * Returns: 0 if the formats and rotation mode meet IPU restrictions,
  * -EINVAL otherwise.
  */
 int ipu_image_convert_verify(struct ipu_image *in, struct ipu_image *out,
@@ -77,11 +78,11 @@ int ipu_image_convert_verify(struct ipu_
  * @complete:	run completion callback
  * @complete_context:	a context pointer for the completion callback
  *
- * Returns an opaque conversion context pointer on success, error pointer
+ * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
+ *
+ * Returns: an opaque conversion context pointer on success, error pointer
  * on failure. The input/output formats and rotation mode must already meet
  * IPU retrictions.
- *
- * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
  */
 struct ipu_image_convert_ctx *
 ipu_image_convert_prepare(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
@@ -122,6 +123,8 @@ void ipu_image_convert_unprepare(struct
  * In V4L2, drivers should call ipu_image_convert_queue() while
  * streaming to queue the conversion of a received input buffer.
  * For example mem2mem devices this would be called in .device_run.
+ *
+ * Returns: 0 on success or -errno on error.
  */
 int ipu_image_convert_queue(struct ipu_image_convert_run *run);
 
@@ -155,6 +158,9 @@ void ipu_image_convert_abort(struct ipu_
  * On successful return the caller can queue more run requests if needed, using
  * the prepared context in run->ctx. The caller is responsible for unpreparing
  * the context when no more conversion requests are needed.
+ *
+ * Returns: pointer to the created &struct ipu_image_convert_run that has
+ * been queued on success; an ERR_PTR(errno) on error.
  */
 struct ipu_image_convert_run *
 ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,

