Return-Path: <linux-fbdev+bounces-5982-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM9aGkulemmN8wEAu9opvQ
	(envelope-from <linux-fbdev+bounces-5982-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 01:09:47 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C60B6AA1E6
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 01:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D61ED3026897
	for <lists+linux-fbdev@lfdr.de>; Thu, 29 Jan 2026 00:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9D41A294;
	Thu, 29 Jan 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiZ6emPL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9602AEEB3;
	Thu, 29 Jan 2026 00:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645373; cv=none; b=XrDnDMxDhYahLUDqaKn3ajR3dZxO1o8QSfmBlvx/i0KZM8Z9h0uTiR8dw/hqa+wls3ye2Af0jk5yo22ioT2ujOdJ85HRn3h+hzgalmQNGuTzaJldR+gbX9nzQca2SpUy17CkBf83HZ5JFXi6eCSoe+dR3uiQbbIRw0MMbgzQmwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645373; c=relaxed/simple;
	bh=O26J1s5Vkn3ZIo+TJ6RWrG8FREowg2fIx+LLm20XLlc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nIKCOI3/mSKcIiimjctjo7t3U/26bHmI8YOIEaccicBPBzXBQQ9MHCmEsAd2e6IUsMKT99csn22tV7fXNI7/eCj2Bgp9HPDvFwCMArYKzmx7eERZuZPRdMGm9zRz6Z5oGjps95GJoIqdkxWQvqyA8PwxkjmckKQnSo5M1gcrlfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiZ6emPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AE7C4CEF1;
	Thu, 29 Jan 2026 00:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769645373;
	bh=O26J1s5Vkn3ZIo+TJ6RWrG8FREowg2fIx+LLm20XLlc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MiZ6emPLI4n4iPSzBekNe5PYTVj6/dtsvhIpoaH8HVTNacNpr5N11qMhOOzH6WvoC
	 mdxC668GPIMV+mh+0SkWD1Upaj4BzT/Rn/bb6atngiHS10mS6+GdJqDs7kQXFTG6gA
	 I4dIrO1oVqwrCuaim/H0pu13JUkY48WWq4LtEVrlnMaEjJAGJvQ7cmVwhPtdC1UVl9
	 Yo2wTPBFucEzH2mQhmW/XYcGvb7nIwFYwmO48VeuVdKAnMJXZu69F5NwV/t46XfASw
	 obCD4lJPX1ZbOh11nn8mNDisVchE2weyFU+DRMkfVrw7qiS4KxTC0geSJ5W6NNRhb4
	 yJw+y76hgNsSA==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:09:21 +0100
Message-Id: <DG0MXC1R8IRS.Y5X6XDUBOGR5@kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Cc: "Zhi Wang" <zhiw@nvidia.com>, <linux-kernel@vger.kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 "Christian Koenig" <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
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
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Alexey
 Ivanov" <alexeyi@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
 <20260121100745.2b5a58e5.zhiw@nvidia.com>
 <e186973c-ce31-405a-8bfa-dc647737a666@nvidia.com>
 <DS0PR12MB6486717785F6DD14EE1F1C46A397A@DS0PR12MB6486.namprd12.prod.outlook.com> <DG07HZN0PL87.X5MKDCVVYIRE@kernel.org> <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
In-Reply-To: <c0a3ac65-e2e5-4b62-bc75-49b1599e160f@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5982-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C60B6AA1E6
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 4:27 PM CET, Joel Fernandes wrote:
> I will go over these concerns, just to clarify - do you mean forbidding=
=20
> *any* lock or do you mean only forbidding non-atomic locks? I believe we=
=20
> can avoid non-atomic locks completely - actually I just wrote a patch=20
> before I read this email to do just. If we are to forbid any locking at=
=20
> all, that might require some careful redesign to handle the above race=20
> afaics.

It's not about the locks themselves, sleeping locks are fine too. It's abou=
t
holding locks that are held elsewhere when doing memory allocations that ca=
n
call back into MMU notifiers or the shrinker.

I.e. if in the fence signalling critical path you wait for a mutex that is =
held
elsewhere while allocating memory and the memory allocation calls back into=
 the
shrinker, you may end up waiting for your own DMA fence to be signaled, whi=
ch
causes a deadlock.

