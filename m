Return-Path: <linux-fbdev+bounces-7012-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEgJKBVZ4WknsQAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7012-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Apr 2026 23:48:05 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08A415169
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Apr 2026 23:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 283AE30FA6B6
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Apr 2026 21:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57908382396;
	Thu, 16 Apr 2026 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kshxNV/M"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C9834F46D;
	Thu, 16 Apr 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375947; cv=none; b=iD2ZrB6HLH2zvwOKs5M2rZPhUPcUA2ALAXfBD5J0z35QsLmOXSn6/OZkBeMa1VUYUkeqhi3+XUUBwXii2YMgLJgIRqr91bkSp+0HxviCt1q1fh7L5bXFjSMp7gQOhPY6zMaAslijiS3yegtzk2eV4/HErtBZVDFYbr+4UVpTA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375947; c=relaxed/simple;
	bh=/AIHtk5dGaoSaB87dJf/1eE9xbVWkZ5BUf/GM/VtbXg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tsW+12fbnqsNEu5q9+QHDwlKQB575F4eQ2RId4hXBNjC8I1tThmUM0xWFOtK1c2ARpEL1JMF1SoksetjmM99qKojU4rX4J+7J3WRAAadhDGuETZWN7Zm+qvGZIXPsWQHdVRTTXe4nMHoObymN7Yo9mb5vVSNraU8xLUIjnHbkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kshxNV/M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DB3C2BCAF;
	Thu, 16 Apr 2026 21:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776375946;
	bh=/AIHtk5dGaoSaB87dJf/1eE9xbVWkZ5BUf/GM/VtbXg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=kshxNV/Mf/SAOfzwvPLHm/KFEujozISoNfYRy6l3ouTWw9jmEQXcjQ+iGPsd6zP5c
	 ZEAWOkywRdxIlMW1KuPs1t3NkXIMbaKjh29VPqTvcbgocmGxgcTswvkFoPSc3KWS8W
	 08CZV0yL+7c0ow8wCZhluF2S/K8P/wzyAW999r0xg/l1Ubd3AId9oLABnxMLA4X/Sh
	 MkxiGhj9qoMuWpHjVGAjnZS/L0O6cxr8QUFQ+NCutGBi2wJLWRkNiZAt0Wi5RNZuKC
	 nDAW7K/hGMdCp2YooKNSgWuIXcFCuILbKSQ4ltxO5bkZC5EHEzCXvs4V1eqR+afVGz
	 SP/rfsLzw0Avg==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 23:45:35 +0200
Message-Id: <DHUWPQX14ZGZ.26BV7GQCJDZQI@kernel.org>
Subject: Re: [PATCH v11 07/20] gpu: nova-core: mm: Add TLB flush support
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy
 Baron" <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Dave Airlie"
 <airlied@redhat.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Nikola Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, "Thomas Hellstrom"
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 <alexeyi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260415210548.3776595-1-joelagnelf@nvidia.com>
 <20260415210548.3776595-7-joelagnelf@nvidia.com>
 <20260416212312.GA667928@joelbox2>
In-Reply-To: <20260416212312.GA667928@joelbox2>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	TAGGED_FROM(0.00)[bounces-7012-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E08A415169
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Apr 16, 2026 at 11:23 PM CEST, Joel Fernandes wrote:
> Btw, I changed this to doing it in 2 phases to avoid holding the RCU read=
lock
> across read_poll_timeout, which can sleep. Will squash it in for v12.

Why do we need the try_access() dance in the first place? I assume this end=
s up
being called from the BarAccess destructor?

If so, I think this is solvable. Gary and me are currently working on
higher-ranked types and a chained Devres type.

With that, such use-cases should be cleanly solvable without the need for
try_access().

Besides that, I can't find where BarAccess is ever constructed.

It already has a lifetime 'a for &'a Bar1, so I don't see why you can't do =
the
same for Bar0.

But again, I don't see this being constructed and I'm not sure the whole
construct works in the first place.

