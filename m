Return-Path: <linux-fbdev+bounces-6101-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFlVLHEhhmm/JwQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6101-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 18:14:25 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC1A100D20
	for <lists+linux-fbdev@lfdr.de>; Fri, 06 Feb 2026 18:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1473F3014114
	for <lists+linux-fbdev@lfdr.de>; Fri,  6 Feb 2026 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2683939DD;
	Fri,  6 Feb 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyhQrtAN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7732A3DA;
	Fri,  6 Feb 2026 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770397998; cv=none; b=CUplVU5F7yDQsBfGIZKLe/SfjKrTY7JGK11C7c35dtMdl7gAQ1RCE3FLrnfZHr6gc56fufUW8ZO5HQJKglAYV2YjtJzynsEqI+Wlj/Q1lbnlV1ovzaS9cN1IpdltlViartOyUVARgl842EOrF3w/8gPMjfiBFgVZWcCpaoDtd1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770397998; c=relaxed/simple;
	bh=VusUcOG57uVq4aP95tB6o/KYonI51RwqmHWJ63rGzUM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=lfoAuEEqc+zNu7BVy1qdbx+xofQA982cZm0K64zHqXzu69OpanixhGW42fmOMX5sQuWda8NJBM0rYNSh08yIGqNPHp6SEFgh7wiiRakPiH8hZMxQw6CXCp+w1eCVx/kLraX4XfmC6W3a0gfQ+TlfOPfDduZVMvq7qjeCqxA8AuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyhQrtAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1083C116C6;
	Fri,  6 Feb 2026 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770397997;
	bh=VusUcOG57uVq4aP95tB6o/KYonI51RwqmHWJ63rGzUM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=RyhQrtANOB+D11Wve/m8L2lLmA2sIYZtIVT7zQ/BhQ3fOrDR8nn1qXOzitA6AFauP
	 jFNpNdriH7tCxOuPCjR6KH6bfyDLu9qNr6V/ZVDeOvQZCpNjaXaqiTIeg9yqQYyg1D
	 vIb+sgs0lvBbA4M2G+fEJkFNMYGE+AwnsQ7mkKVOnZZs2wSBSsyGEZNh6hARQvRyec
	 lK9cgEs8C2fBf3C66y/paf8fUmjjfGbkrltqpuhW2AThwChDilq+cxnZiXKDFJ430p
	 XOSSALCb08kTJLJSXY57IJFBjb3YEOL3zhrE2iMxYwFdZBkzlqceQ/rswM4JhPal97
	 ivpvFOs16n0mA==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 18:13:06 +0100
Message-Id: <DG81PJ9QD8FC.2NF6VEKDD3F2Q@kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
 <DG800TDA6OXQ.275PMMS19F1EX@kernel.org>
 <77ac3274-a962-469d-a2f6-6ccc0670988a@nvidia.com>
 <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
In-Reply-To: <DG80FV3VTT6P.2ZP18EM8605GT@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-6101-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3BC1A100D20
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 5:13 PM CET, Gary Guo wrote:
> On Fri Feb 6, 2026 at 4:05 PM GMT, Joel Fernandes wrote:
>>
>>
>> On 2/6/2026 10:53 AM, Danilo Krummrich wrote:
>>> On Fri Feb 6, 2026 at 4:25 PM CET, Gary Guo wrote:
>>>> On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
>>>>> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
>>>>> index 22dd29cd50b5..2c3dec070645 100644
>>>>> --- a/drivers/gpu/Kconfig
>>>>> +++ b/drivers/gpu/Kconfig
>>>>> @@ -1,7 +1,14 @@
>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>> =20
>>>>> +config RUST_CLIST
>>>>> +	bool
>>>>> +	depends on RUST
>>>>> +	help
>>>>> +	  Rust abstraction for interfacing with C linked lists.
>>>>
>>>> I am not sure if we need extra config entry. This is fully generic so =
shouldn't
>>>> generate any code unless there is an user.
>>>=20
>>> I also don't think we need a Kconfig for this.
>>>=20
>>> In any case, it shouln't be in drivers/gpu/Kconfig.
>>
>> Fair point, I believe I was having trouble compiling this into the kerne=
l crate
>> without warnings (I believe if !GPU_BUDDY). I'll try to drop it and see =
if we
>> can get rid of it.
>
> If you run into dead code warnings, I think it is fine to just
>
>     #[allow(dead_code, reason =3D "all users might be cfg-ed out")]
>
> the overhead of just let rustc type-checking this module isn't worth the =
extra
> Kconfig plumbing, I think.

You mean because there are pub(crate) in clist.rs? I don't think the Kconfi=
g
would help with that, nothing prevents people from enabling RUST_CLIST, but=
 none
of the users.

Besides that, once we have the new build system, the users of CList are lik=
ely
in other crates anyways, so I think we should just change things to pub.

