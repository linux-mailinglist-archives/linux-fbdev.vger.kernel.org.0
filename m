Return-Path: <linux-fbdev+bounces-7703-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jLpYAy2hO2o4aggAu9opvQ
	(envelope-from <linux-fbdev+bounces-7703-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 11:19:41 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 501D36BCDD6
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 11:19:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="d NydEEf";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7703-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7703-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 172B4300E243
	for <lists+linux-fbdev@lfdr.de>; Wed, 24 Jun 2026 09:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8239839DBC5;
	Wed, 24 Jun 2026 09:19:38 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D73955EC;
	Wed, 24 Jun 2026 09:19:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782292778; cv=none; b=ov9NRn0He3xthKnZTaZEoQZM4zZVp98gruwP0h8gvw5B/EZFkVxwirOHKtCd3riIK3GFTvfbjmsV1jEEHUBDh9btK9tPh8AcsVbRJUONM3STbQYtmcZfnEP64aEkrMh17+gN/7COeoe7i6U2ow1I8p2hbTuYlBMplMj43Jiu+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782292778; c=relaxed/simple;
	bh=L1BDgyrbaBIk0q0GjexggCLY/p+AURs/1fKrIrX/Uk4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=jwxlm70OqGP3jS11TJMKVRBe7lwxaCQ3DnrchHfWVDAS+sxcA7dYvyIOjqrNa888oLhR6fUiyP+rlIAIP85BTMkkRiWVQYfGWzDBfa/tsOnDWajycGsKw+jQa6LFoG0V53oNrO61vqN6amzeH5aI4Wh2+Cjic3NO24G4cu7SuCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dNydEEfk; arc=none smtp.client-ip=117.135.210.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=L1BDgyrbaBIk0q0GjexggCLY/p+AURs/1fKrIrX/Uk4=; b=d
	NydEEfk/f6YHfxScXsjcS4+6cJOsJF9A7yq2Ttdvwrt2G0rblTrx9T/9yuvRMMXl
	Tj1fCb9+9cg5NDBwGhNndLhb7fvqHPnEk5fSB1gQEHTWILV+ILS1Sh4KySnHV8W5
	EEb68q11F5m4qNVslWFchZhnsXAuu0wzDq5KBVnW5I=
Received: from haoxiang_li2024$163.com ( [36.112.3.223] ) by
 ajax-webmail-wmsvr-40-108 (Coremail) ; Wed, 24 Jun 2026 17:18:44 +0800
 (CST)
Date: Wed, 24 Jun 2026 17:18:44 +0800 (CST)
From: haoxiang_li2024  <haoxiang_li2024@163.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: deller@gmx.de, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	"Philip Blundell" <philb@gnu.org>,
	"Kars de Jong" <jongk@linux-m68k.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re:Re: [PATCH] video: hpfb: Unregister DIO driver on init failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <CAMuHMdUSVacMR2Lb-VwkeZMrS=wKz9y+XtF=nAOCuSLbDs-HdQ@mail.gmail.com>
References: <20260622064915.767194-1-haoxiang_li2024@163.com>
 <CAMuHMdUSVacMR2Lb-VwkeZMrS=wKz9y+XtF=nAOCuSLbDs-HdQ@mail.gmail.com>
X-NTES-SC: AL_Qu2TAP6SvU8p4iSaYOkfmUwSj+s8WsO0vf4i245fO5B+jCLpyzEDYXpkLHTOzeC2LxuSuwqcbydQy+9XTK1GRYskqBOo6GyuEBdF3rm8s9BhGQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <a5a64f9.8403.19ef8ecbad4.Coremail.haoxiang_li2024@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bCgvCgDnx_v0oDtqYwkQAA--.969W
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RTOPWo7oPSwRQAA36
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:philb@gnu.org,m:jongk@linux-m68k.org,m:linux-m68k@lists.linux-m68k.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7703-lists,linux-fbdev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[haoxiang_li2024@163.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,sea.lore.kernel.org:server fail,linux-m68k.org:server fail];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,vger.kernel.org,lists.freedesktop.org,gnu.org,linux-m68k.org,lists.linux-m68k.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haoxiang_li2024@163.com,linux-fbdev@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[163.com];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 501D36BCDD6

CgpBdCAyMDI2LTA2LTI0IDE2OjUxOjAyLCAiR2VlcnQgVXl0dGVyaG9ldmVuIiA8Z2VlcnRAbGlu
dXgtbTY4ay5vcmc+IHdyb3RlOgo+SGVuY2UgaWYgdGhlIGRldGVjdGlvbiBvciBpbml0aWFsaXph
dGlvbiBvbiB0aGUgaW50ZXJuYWwgYnVzIGZhaWxzLAo+b3RoZXIgZGV2aWNlcyBvbiB0aGUgRElP
IGJ1cyBtdXN0IG5vdCBiZSBmb3JjZS11bmJvdW5kLgo+Cj5UaGlzIGlzIGFsc28gdGhlIHJlYXNv
biB3aHkgYW55IGVycm9yIHJldHVybmVkIGJ5Cj5jb3B5X2Zyb21fa2VybmVsX25vZmF1bHQoKSBp
cyBub3QgY29uc2lkZXJlZCBmYXRhbC4KCj4KClRoYW5rcyBmb3IgeW91ciBndWlkYW5jZSEgVW5k
ZXJzdGFuZCB0aGF0IG5vdy4KCgpUaGFua3MsCkhhb3hpYW5n

