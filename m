Return-Path: <linux-fbdev+bounces-7856-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u75hD07JTGoHpwEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7856-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:39:26 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 21970719E47
	for <lists+linux-fbdev@lfdr.de>; Tue, 07 Jul 2026 11:39:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=gM2ddroG;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7856-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7856-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6B5F307C3E4
	for <lists+linux-fbdev@lfdr.de>; Tue,  7 Jul 2026 09:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5292B3905FD;
	Tue,  7 Jul 2026 09:06:14 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2035C390205;
	Tue,  7 Jul 2026 09:06:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415174; cv=none; b=gq5TzSbLOUBKnPBmJBc2tl3yWpW9P4vdTs+4ZL+nV1QEVRJDRtiwi9i+Ky/igAVyyAS9T4NcNC3pt6Cix8v4nr0QHqpyb8uCP1HOyYdeWAdxjnfVSZokoxHD3au7Mzi4ti3tE6lALcvSfi544aOHnbqLf4JsR/Mr4SFewGfNtgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415174; c=relaxed/simple;
	bh=28FqUzoGc80n7Xui8X5xCXQl0CqfdJwwDkKoGdcTNrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ti/mT2VrCzzKtaeWStwAJAxDKX0JOsA2Qi7jtGfwYBNF8vHE4jLeX/efzPxQ0YCkfjjDDZB01uh/hXfiH29vM+ul0eIA5fLaS7npexKsUyTD+p4ibOsSeBVnN/Gncjd3SzN2X1/HNsMMcyKeYGupmokVOWhB0WR0ujIpJLN1Fe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gM2ddroG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517151F00A3A;
	Tue,  7 Jul 2026 09:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783415172;
	bh=6vSbk8Qzyw7M2MWzxo8RNMDE82ejPy5u8VmkzuaO5SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gM2ddroGoBTHOtRvhXV2SLAtY4LNiPAcbLxx2LAQvxBxHouA8ecWbK+WJ/hblbzre
	 AeYO0ZKgv7qmknmrBO5nw8GChNoW2RmkjmDi+b2mdZvkmeVpbY4pHSOIyanKfPalNm
	 uhR3SjfLqk7xoIU7UOghhwfT4nJHcNyD4JybS9Lc=
Date: Tue, 7 Jul 2026 11:06:10 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Gabry <Gabry.256@proton.me>
Cc: "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>,
	"teddy.wang@siliconmotion.com" <teddy.wang@siliconmotion.com>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: rename Bpp parameter to bpp
Message-ID: <2026070743-stubble-brick-6d56@gregkh>
References: <hpslpD7esY-xE37Tvrz0V8gD8YoZwdu6IlQ8LjUz5fY5mevEeDxM-dLC64t43G4mpVfHB_xCDUESoNFZ7ua9k7B_k2NrY2u-P6NYIJSuGt4=@proton.me>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hpslpD7esY-xE37Tvrz0V8gD8YoZwdu6IlQ8LjUz5fY5mevEeDxM-dLC64t43G4mpVfHB_xCDUESoNFZ7ua9k7B_k2NrY2u-P6NYIJSuGt4=@proton.me>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FROM_DN_EQ_ADDR(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Gabry.256@proton.me,m:sudipm.mukherjee@gmail.com,m:teddy.wang@siliconmotion.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:sudipmmukherjee@gmail.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-fbdev@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-7856-lists,linux-fbdev=lfdr.de];
	TAGGED_RCPT(0.00)[linux-fbdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:from_mime,linuxfoundation.org:dkim,vger.kernel.org:from_smtp,gregkh:mid,proton.me:email,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21970719E47

On Thu, May 28, 2026 at 06:36:45PM +0000, Gabry wrote:
> The Linux kernel coding style prefers snake_case over CamelCase foridentifier names.
> 
> Rename the 'Bpp' parameter (bytes per pixel) of sm750_hw_fillrect()
> and sm750_hw_copyarea() to 'bpp' to comply with this standard. Update
> the function prototypes in sm750_accel.h and the corresponding
> kernel-doc descriptions accordingly.
> 
> This is a pure rename with no functional change, and addresses a
> checkpatch.pl warning:
> 
>   CHECK: Avoid CamelCase: <Bpp>
> 
> Signed-off-by: Gabriele Rizzo <gabry.256@proton.me>

Does not match up with your "From:" line :(

Also, this is the second version of this patch you sent out, what
changed from the first?

thanks,

greg k-h

