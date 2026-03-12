Return-Path: <linux-fbdev+bounces-6594-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KP9wAygZs2mDSAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6594-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 20:51:04 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1927855A
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 20:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 774C53006939
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 19:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781C8331222;
	Thu, 12 Mar 2026 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnfOuik6"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460D31AF3B;
	Thu, 12 Mar 2026 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773345047; cv=none; b=sI0ewF3jsZ8ctFMS/S6yVPxz+U1uNbkKciGeBbo7ot8FAq+9H5f8zUs8ichb5p8s58NrT39DKRK3g6rK5MzRFzOH9yUhdHyI0i/4S/r3jly/Ar45EAD3n/P69KH0+/i9GQSpHvRX306B3qO4Ai/0zbA5rDn1QHGVQ4RMmT/wxJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773345047; c=relaxed/simple;
	bh=wOHCpU/qUlJ9QLzJ1oUzFBOjTVtulCOI/8sgb9G5W/A=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=TFcwts686oOy3CtiUdaspIYY7VGAlua2Z8VhyG1WMLaOFEr7NO5cdnThfJhC+MFgGrUqCSwqTczApE0gtRn+8aRJzErMr3QJL9r0nyAer8BNWaNEZ0EpmtoYC2Ty3/4Vy186duWlg+3iZ+76lO7MJlRBFHzan1Np7rC0H23O8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnfOuik6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD85C2BC86;
	Thu, 12 Mar 2026 19:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773345047;
	bh=wOHCpU/qUlJ9QLzJ1oUzFBOjTVtulCOI/8sgb9G5W/A=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=ZnfOuik6oAR63sev2BS1ZVFdfaVftV+psQSvuZthQeM1iH71vFl8qpXyV13mTPMIf
	 WZWoHZO00Sx38lkpSJQR1Onft7yFww72aa2UEcO7oWjoxdF1a8GyzEE8o9Hah9boZq
	 Mul2o5Cx8SMESt7oEn7gkF8Gp8cqHWwdHBFESmtm3oPOKr1Ufj4kjns2gda6L7B9sg
	 bTHvnDaZAWYquD700jGYAAgzjerLPNNBAf6iSWj6AgqzYQhBMCBXCDlj+t3BQRdvF6
	 S5Jue3vIToOjPfQUk2B+8bFtIjDviEBVhdmPlXlPa2Cg6V62TwmhdfYtzitIdMVCay
	 Cp2RCyKYBJ83g==
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 20:50:34 +0100
Message-Id: <DH12CMFJNDMF.D3F50HV9020X@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked
 list interface
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Dave Airlie" <airlied@redhat.com>, "David
 Airlie" <airlied@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Simona Vetter"
 <simona@ffwll.ch>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Koen
 Koning" <koen.koning@linux.intel.com>, "Nikola Djukic"
 <ndjukic@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Philipp
 Stanner" <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Jonathan Corbet" <corbet@lwn.net>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>,
 <alexeyi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com>
 <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
In-Reply-To: <CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid89LExw@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6594-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42B1927855A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 12, 2026 at 8:20 PM CET, Miguel Ojeda wrote:
> On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>>
>> +//! // Create typed [`CList`] from sentinel head.
>> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` w=
ith
>> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over=
 `SampleItemC`.
>> +//! let list =3D clist_create!(unsafe { head, Item, SampleItemC, link }=
);
>
> Was the patch tested with Clippy? It has several issues.

I did not give it a shot yet, but given this and the other nits, this is be=
yond
what I want to fix up when applying the patch.

@Joel, can you please resend?

Thanks,
Danilo

