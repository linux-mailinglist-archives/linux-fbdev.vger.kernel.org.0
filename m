Return-Path: <linux-fbdev+bounces-7681-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NFuSOVhHOmrm5AcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7681-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 10:44:08 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C76B55A8
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 10:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=R0u4f0vm;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7681-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7681-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663C230293D4
	for <lists+linux-fbdev@lfdr.de>; Tue, 23 Jun 2026 08:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BD13CF049;
	Tue, 23 Jun 2026 08:43:54 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BAE3CEB8D;
	Tue, 23 Jun 2026 08:43:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204234; cv=none; b=Uol4adDtVNxGs6XH7LDx/J26fcpT4b6hXNQ+IDfilx4umZQob2GKB/nxYgraqkZJP88puujxBvsVIoKiNJi8iAVD5beJDxr+xqUdRLbFNmwTgh7sQRW9T/wbHJZRtWWuiDJnFlikwFTlGwLlCC3LU+PMsyHzh5KrQ8heDYJcVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204234; c=relaxed/simple;
	bh=BtyTOmTB6jsKnLzsaKNVwFFXbcizT+Rax8+sy9JZ5rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLBAZyrAWY4tLXhjGg7kcFoCufkh3vT7cf1OImM1+CzmWQVzrkUn6vNP6KM56p29MlezGaqUrOfJpBJTQGRLwpGF0+9CpvPm8jo2PW1EygUuGrtdWq/BEm0ihGW0sLwAZ8M6ojNuQcnKDwaieGvrHNn1+U3YwxW+KIr9R5c+qcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0u4f0vm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FB51F000E9;
	Tue, 23 Jun 2026 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204233;
	bh=9N7Z/t3yS/fJOyNmuIzO1Bt4wNfsxzy25SOgFyC2mdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R0u4f0vm++dpzVcMtZGMaEUor0mZo4RbD9F8Ws0y+OR8CSmusOJvIV/yg6VpnpPOH
	 UTxSf9Er79H2Mi+/K0PWjVCg5j0xMoLeY0VLb64CfaJ4AAZay+kbNA31urbSW9YpHL
	 8pVsyxHG41J5ee9VZjRYYV4UNR48aKO7by0P3ubMouhfz/4nYvTPZqEUMiVHDg4ftC
	 T+nwBesuiiBsScOqLCmsQlbX9Obzq6GVBayK/KB1CGKD7zFXZJ3wXPtl0x8ysWEzQg
	 8mZihPskb4J5pDTWA7SOQuIbjobbsQr/2aWrMa+nw6DgE0FxDIhEMmXAeasNDKx9Si
	 bnsQ02SRcuJfA==
Date: Tue, 23 Jun 2026 10:43:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: javierm@redhat.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org, 
	gregkh@linuxfoundation.org, deller@gmx.de, azuddinadam@gmail.com, chintanlike@gmail.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/4] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
Message-ID: <20260623-debonair-wonderful-bug-e8abb3@quoll>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-2-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622152506.78627-2-amit.barzilai22@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amit.barzilai22@gmail.com,m:javierm@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:deller@gmx.de,m:azuddinadam@gmail.com,m:chintanlike@gmail.com,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:amitbarzilai22@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-fbdev@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-7681-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linuxfoundation.org,gmx.de,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 450C76B55A8

On Mon, Jun 22, 2026 at 06:25:03PM +0300, Amit Barzilai wrote:
> Add a device tree binding for the Solomon SSD1351, a 128x128 65k-color
> RGB OLED display controller driven over a 4-wire SPI bus. The binding
> builds on the shared solomon,ssd-common.yaml properties already used by
> the other Solomon display controllers.
> 
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  .../bindings/display/solomon,ssd1351.yaml     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd1351.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


