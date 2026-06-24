Return-Path: <linux-fbdev+bounces-7711-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aMtJCelSPGqTmggAu9opvQ
	(envelope-from <linux-fbdev+bounces-7711-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 23:58:01 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 131326C1A2E
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 23:58:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fastmail.org header.s=fm1 header.b=YED66C0E;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="K B560JV";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7711-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7711-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=fastmail.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31B3E302C28C
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 21:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CE32F290B;
	Wed, 24 Jun 2026 21:56:57 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6652D7386;
	Wed, 24 Jun 2026 21:56:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782338217; cv=none; b=SY8EbMqi4oBaS3yMZzTTszPCrxA0EXvgtC7CkADZVss9grRyoQ8xB3FPr+q64VIl+jXFzAuXAw5t6H447QCLeCcHAIkdMu0Er2phUxOinnXo4Su9wrjO3S5UNsGpemXv21iRO1Rr2Sp6/AffL/E9AkvFMtJSw0EhX2CBNEoZn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782338217; c=relaxed/simple;
	bh=yEhz7oX3adMsyFj9N5HpnJ4qRUUB/WZ0XtEMfdyuY8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU5Fc2W41Nvam2+hr2h72P/O5kdONsaYhv7GuGiJNnhz4adJc4/TGNhiBqUhemclPhYU0pPE68ZLUwSdo/DP/rLuMEvEixcUQOYJxWkK1qI+OceJDxw8l7feHsBq8vZ20rc3R9OD9xWIgf+/PoVBlS98uH4Zk5rXiZmMGxt6mCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=YED66C0E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KB560JV+; arc=none smtp.client-ip=103.168.172.142
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 1272F13807EA;
	Wed, 24 Jun 2026 17:56:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 24 Jun 2026 17:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782338198;
	 x=1782341798; bh=++Hjyr/flMkWyZftah+JkNBEHI2dny5JtQZ8P9/MZG4=; b=
	YED66C0E2IMe73v0XetOqZXPuwuog+doss/UaSc1tk9kL4Be5G0LR+K6yeAm4YTa
	YzDZjfVD9fslgvWj00VnPSNWyoxWyhT4V6dwS91tWtBfQXYaoOC7QFs0DCNBc+PC
	U2CG5oaPYI2SEL4gd58uAaBx3k+Z+CwHQBoMBZKsIO9BtskNcYlg3b4VoQzZ2Nbf
	HcA40UYBwe6AlWX7n3igNVV0DVZ7lOoLWrKV/O9xxjBqzSyWB7Id+il7xukLjDiv
	Umyq9iKPlv60q7qjugb/RgxtmPMGK9NqlImDLY5PiObXNKRdHXRtP/q3ULagA21+
	+X6GtG8rS1ieOzAqHhCUHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782338198; x=
	1782341798; bh=++Hjyr/flMkWyZftah+JkNBEHI2dny5JtQZ8P9/MZG4=; b=K
	B560JV++2VbtnNqcqV7JA0WK+BDLBm4agN2NoGFvwn9N1kkhOlphPV2b8IpPnbWE
	fyHjPGAmJlsyvkEq+CQEXOKtPGMZVS7oyT8KeNDeTcWGQL0YkuJxG8SyDPpc9vo7
	oFnLfMht2P0DdIvXczzUO4TV7++B04gPa6UUV1ZF5xAs6qDsJzMSl4NUtopFMhzw
	5cBseXeDkuuFXjr776XdtGsOZET4qUYLWUCdgmTjDomTejkGwF/8+jUf69xVufKV
	fyUh7PKFPZtyS20YwPBQCOZyzpItTUSvpBWL+kw/AqyskjF/Sj9Bx0UEHFImFboH
	3ADYJNTF1rnq+SSyv2p8w==
X-ME-Sender: <xms:lVI8ap-2DdrHo0IsiEKSrQBBK0D9TjjemYyIUBocN3dm4K67wU9_pA>
    <xme:lVI8asyW5vRP1jhOKL8iVoG8kUiJ6TH-HoYJAEcdVY-Cpi49f1mosqLWGo41cAdk-
    wbcPTuJrTQzBvvAbsgd6qeiGlHsWLRKR7Mxo3eaQsO3G8Jl6U7KjA>
X-ME-Received: <xmr:lVI8atM6RvGD-6LU2mhgsVFCf3w1mGoodjbmZCV0G46oH3Ih_B00inPj1iA>
X-ME-Proxy-Cause: dmFkZTEgvGkpZ5p2QPL5lJ6IWjjT4tYK8UbnmaNzxExsASxMTRkHIPRCwrrXhraNRIyWDv
    SAipnGeJ4XhINc/4rHq4Id+gB20D86mt5I67kiQLtsg3LrbcEKnlao1LFnLJViJjnuod0C
    +btXPJU6vwvwu1X6dEZ68qUaKa9VcSNvxkOzsYxl6RPaBfsLuaKDgO+nl0ptXC9tHG2yBS
    wJiKfuMYzdBSDvN//7TzjOHaUwmPGZdUh3jiFGZJKrXC9CW6HObFOb/nJmVLCYtg620FYK
    WyH0UySQ/byKd6nMb/hIrwPmIb2ntnNsIEpVvWomqj5+n5MW0tjvMZMyH1c0QrChm4esre
    gOCLfCfAEJ0nfGR5vVV8aZJd/U5PjGax7vcpL3C6N77VWwkZPZxdYoHnxC/GTG4Bq51jsj
    j1C5zi2ij8qieOSFzNt7TbdklyLhZrO0/s7o99ZvtiV/r7uQSG8WKZwVJefrNKjfH6+4iD
    XqVKte/04NI0A5PHgdn0EkDxfXVl2EqIYzWpbNnq1hpkns6zZb7XG0z65zmd8AD0AhvLNC
    wvzwgRmlAzL4Bdr+XEZxsQu6JcKc384yf+GfcX8GEawqyE/+OcCvMceGwpouDkv68VGhmJ
    NaEMfwsVbf5ilXaSZTzrIzBL3VWuY9jMUqEtwVw2aF1a8vC6M8zUp0gdzRYQ
X-ME-Proxy: <xmx:lVI8ap-7LX2cqV6jpSmmMOTgaN_2TwwqfOhXrJbLxqvCFfGT3TgOgw>
    <xmx:lVI8ai5L3GMBrKZMvYl8b0zn2SgvLQW0RBclLrnyTeYTOSOgNrJdLQ>
    <xmx:lVI8an5Ud4MgWO5EEf4TV70pQxcULM_ckSan3yialUIOMP9SMlGydg>
    <xmx:lVI8ajp-o9p1krTjN_8kzOW-vSZ5SNGXtH1hVySQiS9-aw9672PbqA>
    <xmx:lVI8ag0gfJb4x02entmBKNu1tK9F57kP2Z8FP56xXJfUWLHhvEAsydmW>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Jun 2026 17:56:36 -0400 (EDT)
Date: Wed, 24 Jun 2026 16:56:34 -0500
From: Ian Bridges <icb@fastmail.org>
To: sashiko-reviews@lists.linux.dev
Cc: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbcon: fix NULL pointer dereference for a console
 without vc_data
Message-ID: <ajxSktk5FqXOfWuA@dev>
References: <ajxICA0v-_5NrqhS@dev>
 <20260624213027.6C1E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624213027.6C1E01F000E9@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fastmail.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[fastmail.org:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7711-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[icb@fastmail.org,linux-fbdev@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:deller@gmx.de,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fastmail.org:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[icb@fastmail.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,dev:mid,sashiko.dev:url,messagingengine.com:dkim,fastmail.org:dkim,fastmail.org:email,fastmail.org:from_mime,syzkaller.appspot.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 131326C1A2E

On Wed, Jun 24, 2026 at 09:30:26PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Pre-existing NULL pointer dereference via `font_data_get(NULL)` in `fbcon_set_disp()` if the foreground console's font is uninitialized.
> - [High] Pre-existing NULL pointer dereference in `fb_videomode_to_var()` when a console is switched to or resized while its `mode` is NULL.
> --
> 
> commit 6f0719a9bd0a2231fe53bfe57ca1abf9ddec2785
> Author: Ian Bridges <icb@fastmail.org>
> 
> fbcon: fix NULL pointer dereference for a console without vc_data
> 
> This commit fixes a NULL pointer dereference in fbcon_new_modelist(). It
> does this by ensuring a console's mode is only set while it has a valid
> vc_data structure.
> 
> Closes: https://syzkaller.appspot.com/bug?extid=42525d636f430fd5d983
> 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index b0e3e765360d1..7187be0eea872 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -1274,6 +1274,7 @@ static void fbcon_deinit(struct vc_data *vc)
> >  	int idx;
> >  
> >  	fbcon_free_font(p);
> > +	p->mode = NULL;
> 
> [Severity: High]
> This is a pre-existing issue, but does setting p->mode to NULL here expose
> us to a crash during a VT switch?
> 
> If a subsequent fbcon_init() fails early (e.g. var_to_display() fails to find
> a matching mode), p->mode will remain NULL. Later, if a user switches to this
> VT, the VT layer calls fbcon_switch(), which unconditionally passes p to
> display_to_var():

This is a seperate bug that I'm also working on a patch for (although it
is proving a bit more difficult to find the correct place to make the
change). The NULL mode that fbcon_switch() reaches through
display_to_var() is set by var_to_display() at
drivers/video/fbdev/core/fbcon.c:988, which assigns disp->mode the result of
fb_match_mode(). On the no-match path that result is NULL, independent of
this patch. The p->mode = NULL added to fbcon_deinit() only applies to a
console that has been deinitialised and has no vc_data. fbcon_new_modelist()
skips such a console through its existing mode check, and the console cannot
be switched to without first being re-initialised, which re-runs
var_to_display() and overwrites the mode. So this patch does not add a path
that reaches display_to_var() with a NULL mode. The dereference is reached
when the modelist is replaced from userspace while fbcon is unbound.

> 
> drivers/video/fbdev/core/fbcon.c:fbcon_switch() {
>     ...
>     memset(&var, 0, sizeof(struct fb_var_screeninfo));
>     display_to_var(&var, p);
>     ...
> }
> 
> display_to_var() then calls fb_videomode_to_var():
> 
> drivers/video/fbdev/core/fbcon.c:display_to_var() {
>     ...
>     fb_videomode_to_var(var, disp->mode);
>     ...
> }
> 
> And fb_videomode_to_var() immediately dereferences the pointer:
> 
> drivers/video/fbdev/core/modedb.c:fb_videomode_to_var() {
>     ...
>     var->xres = mode->xres;
>     ...
> }
> 
> Can this lead to a NULL pointer dereference if the modelist is altered from
> userspace?
> 
> >  	idx = con2fb_map[vc->vc_num];
> >  
> >  	if (idx == -1)
> 
> [ ... ]
> 
> > @@ -1445,14 +1446,14 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
> >  
> >  	p = &fb_display[unit];
> >  
> > -	if (var_to_display(p, var, info))
> > -		return;
> > -
> >  	vc = vc_cons[unit].d;
> >  
> >  	if (!vc)
> >  		return;
> >  
> > +	if (var_to_display(p, var, info))
> > +		return;
> > +
> >  	default_mode = vc->vc_display_fg;
> >  	svc = *default_mode;
> >  	t = &fb_display[svc->vc_num];
> 
> [Severity: High]
> This is a pre-existing issue, but can this lead to a NULL pointer dereference
> in font_data_get() if the foreground console's font is uninitialized?
>

The block quoted sits below the hunk, and this patch only moves the vc_data
check ahead of var_to_display(). That block is reached only after
var_to_display() succeeds and vc is non-NULL, which holds in both the old and
the new order, so its reachability is unchanged with this patch.

Ian

> Just below this hunk in fbcon_set_disp(), the code does:
> 
>     if (!p->fontdata) {
>         ...
>         p->fontdata = t->fontdata;
>         font_data_get(p->fontdata);
>     }
> 
> If fbcon_init() previously failed early for the foreground console, its
> t->fontdata could be NULL. This assigns NULL to p->fontdata and then passes
> it to font_data_get():
> 
> lib/fonts/fonts.c:font_data_get() {
>     if (font_data_is_internal(fd))
>         return; /* never ref static data */
> 
>     if (WARN_ON(!REFCOUNT(fd)))
>         return; /* should never be 0 */
>     ++REFCOUNT(fd);
> }
> 
> The REFCOUNT() macro and font_data_is_internal() will unconditionally
> dereference fd, causing a crash if it is NULL. Does this need an extra NULL
> check?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/ajxICA0v-_5NrqhS@dev?part=1

