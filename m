Return-Path: <linux-fbdev+bounces-5981-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAWpIYKjemlk8wEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5981-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 01:02:10 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA296AA130
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 01:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 23CD73004688
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 00:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA124A01;
	Thu, 29 Jan 2026 00:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyzN/XNr"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24488186A;
	Thu, 29 Jan 2026 00:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769644923; cv=none; b=f3SUQ5v1aPJ4BwSa/EfD6DHPx2B8OmoUqWa/RR3/DBkRDzCI3xBm4R/ZsG6hlfOM9kg5KxGBb1sdFrEt4S1jOyQwnxVF0iV2g4AUGpFHG6gXrQ6PGjOgq/X4FwHTfpGLxs/j1rjzu34HPIwTa5yQGPAcf/zRRM8GQDQ+hi5kBpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769644923; c=relaxed/simple;
	bh=J/qTG4pGilyGtjcne9Wna5dgdSlO8aWgnStkPw5cJ5s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Bonzi2+CYbQa3I6JGYbaQpwA8yymncipW8qGYwZ/ebuD9Yf1Jpm+iSqemmiLwcavWkh0nbyVVf1uQdHdZtQjQKEQUqLpjnXPaM48+jVrbXD+1aYFNlLLwJJIOOQXAJJXl+RFl1mjPcVW1ZIgmaEW3f+8wJ0e252M7nUX2bbJE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyzN/XNr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D92C4CEF1;
	Thu, 29 Jan 2026 00:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769644922;
	bh=J/qTG4pGilyGtjcne9Wna5dgdSlO8aWgnStkPw5cJ5s=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uyzN/XNryhWrkcwztJ1WDKwN2hRmBTjqVOAbay5Pscnv+XQjxVH9M6+HD/FyMGR3K
	 TaHM9mmkVsQZcgRFbQStI4OOiB17+Pc+1XtzMZaameGAmZoU19Ew4kHWBmraxKbs9M
	 wJWQAzCywbHH8zz+cBXS5jx+ozMnDrqk90az1LyFCu6iTt0o0tHpr0DZgRyRLYa9//
	 6+lNbiu3M/msZ7e/cB9u6XpAJJgV/yTK9VVM4FJPIl43xDuVeHACpSTUX6CGD+s5WP
	 HjycssjkDZgJZTrOO9ArKose7tzewQYeNivbhVsN62lQzGPKv0YuDTITCXQP7zUwzW
	 aqiQRk2BQY3sA==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:01:51 +0100
Message-Id: <DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org>
Subject: Re: [PATCH RFC v6 00/26] nova-core: Memory management
 infrastructure (v6)
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Vivi Rodrigo" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Rui Huang" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>, "Helge Deller"
 <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy Baron"
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Alexey Ivanov" <alexeyi@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DG06XUWOJLO5.1ESB8ES6A6081@kernel.org>
 <4540DD73-77BA-45F0-B686-32EB96402717@nvidia.com>
In-Reply-To: <4540DD73-77BA-45F0-B686-32EB96402717@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-5981-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA296AA130
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 1:44 PM CET, Joel Fernandes wrote:
> I will split into CList, GPU buddy, and Nova MM as you suggest.

Thanks, together with a proper changelog this will help a lot.

> One question: what version numbers should each split series use? CList wa=
s at
> v3 before being combined, and similar story for GPU buddy and Nova MM. Sh=
ould
> I continue from the last version number they were posted with, or continu=
e
> from v6?

I'd say from the last version is probably best. Maybe you also want to move=
 out
of the RFC stage for some of them.

Thanks,
Danilo

