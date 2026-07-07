Return-Path: <linux-fbdev+bounces-7872-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7vBENCP0TGoQsgEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7872-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 14:42:11 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 155A271B746
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 14:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kemnade.info header.s=20220719 header.b=ZeWlRbob;
	dmarc=pass (policy=none) header.from=kemnade.info;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7872-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7872-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE68730973D0
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 12:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF76040A946;
	Tue,  7 Jul 2026 12:33:00 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF723FFF8C;
	Tue,  7 Jul 2026 12:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783427580; cv=none; b=kv/+8k0X5R443xGD2W+zYHvscb4VvTL6fprtqnaIjSM3p7QqyH23U+otMQw/FXaf5V2avqkcDfA6DD97Cl7MGNabnPjWjwN6YNd6vqATNKEQneMCAjJoj4jWCFc5RmSgXwTb60AxcNFqHPQDcBhrt9gcfaIAT6ziJFpcg5C72ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783427580; c=relaxed/simple;
	bh=jjBM9uBg4GNRJAA5jD9ZbVotfoOzWeYAB0imw5MTdIk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsufLgOdtKb3P6AlcO8H9mLz6FpAMa0q0gOk+La7fsS0w2R2qs9+Vm4XKD0Ov1MAy2DEL7G3f9s7XZ6XQ3B3bdOnTGhUpgB4whB6kQclt5s5i5KsDkYhHGKnHlHJHwcQrsQeJAzohoRK4GqWPqraQ1nVAcpXjE53CUeLk9vVZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=ZeWlRbob; arc=none smtp.client-ip=178.238.236.174
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=WhKnRiGBppKNpN86Hrh1BNfq/F8SUBk6UDvxQS7rtwE=; t=1783427579; x=1784637179; 
	b=ZeWlRbobYriXf4b8YciyeYjCsLBeSQ+I1oFounRqs8PDkCuc0ZLdxln6pej6OAYPs0dqjObivhz
	aiQM46xnqHxGfRW7ra8QBkUV7rT8Ko4ZlwGzunqoy7wXeQab5XfVVDfzDBIwYJ740VW9juLvQQ6tw
	vbonoqMBK6vaPDrx1gVJl8DEPBJWwoDMQVxINAPP8KM8xVDafjfc1W8wZ2LaSipCbZ+3q1acTnVN4
	YEyIC08Hgoc2GQ5HGahpKLMqcTq4LnhAVqG7+M9IwHvWAP7B+EngVmmiSistLfc96PaFOc4xK5nAi
	3wVZuyXt37Le/5Z71ZbJOFnH3edojQArn6xg==;
Date: Tue, 7 Jul 2026 14:32:54 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org, Helge Deller <deller@gmx.de>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sashiko-bot@kernel.org, Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH] fb: omap2: dsi: do not copy isr table
Message-ID: <20260707143254.76bbb791@kemnade.info>
In-Reply-To: <20260702160541.340B11F000E9@smtp.kernel.org>
References: <20260702-fbomap-uaf-fix-v1-1-6417edf9d3e7@kemnade.info>
	<20260702160541.340B11F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kemnade.info,none];
	R_DKIM_ALLOW(-0.20)[kemnade.info:s=20220719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7872-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sashiko-bot@kernel.org,m:deller@gmx.de,m:sashiko-reviews@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:linux-omap@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andreas@kemnade.info,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmx.de];
	FORGED_SENDER(0.00)[andreas@kemnade.info,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreas@kemnade.info,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[kemnade.info:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-fbdev];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kemnade.info:from_mime,kemnade.info:dkim,kemnade.info:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 155A271B746

On Thu, 02 Jul 2026 16:05:40 +0000
sashiko-bot@kernel.org wrote:

> [Severity: High]
> This isn't a bug introduced by this patch, but it appears the identical
> use-after-free vulnerability you are fixing here remains unpatched in the
> equivalent DRM driver.
> 
> Does drivers/gpu/drm/omapdrm/dss/dsi.c:omap_dsi_irq_handler() need the same
> fix? It still copies the table and drops the lock:
> 
> drivers/gpu/drm/omapdrm/dss/dsi.c:omap_dsi_irq_handler() {
>     ...
>     memcpy(&dsi->isr_tables_copy, &dsi->isr_tables, sizeof(dsi->isr_tables));
>     spin_unlock(&dsi->irq_lock);
>     dsi_handle_isrs(&dsi->isr_tables_copy, irqstatus, vcstatus, ciostatus);
>     ...
> }
> 
> This could still race with a timeout in dsi_sync_vc_vp(), which creates a
> completion on the stack:
> 
> drivers/gpu/drm/omapdrm/dss/dsi.c:dsi_sync_vc_vp() {
>     DECLARE_COMPLETION_ONSTACK(completion);
>     ...
> }

Enitities with access to cerebral richness can find the link in the patch
to the version for the drm driver.

Regards,
Andreas

