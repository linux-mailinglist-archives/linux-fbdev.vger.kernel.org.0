Return-Path: <linux-fbdev+bounces-6708-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMA6FmzAwmmjlQQAu9opvQ
	(envelope-from <linux-fbdev+bounces-6708-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2026 17:48:44 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2A319582
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2026 17:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F6B830A84A6
	for <lists+linux-fbdev@lfdr.de>; Tue, 24 Mar 2026 16:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66E83FADFB;
	Tue, 24 Mar 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usi8u7sy"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D738AC60;
	Tue, 24 Mar 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370428; cv=none; b=gV+0HEt479NqkNeiKnI0Yygt4ne+ihsn78WqwRTI9UVcaJTKUndnVHL+9fVJZbWELsaN78BySxV5Cf2UEuL2E4uZ1de/SP0z7vaD4V+871LJWV38CbbBdD+Zqk4fzAf0blRYrsDkE3UGBpFvDCqQNfICKpjXWVBcO4Rveu070MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370428; c=relaxed/simple;
	bh=kkEoPq9q8fepKtiANcT9ZAfQh5CvujgTy1fMX5zG1GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DncrfyxbL7qjzBUOg+nZ2MeZjjLof6iTX7fBPsJ7EJ3bpXYRJroTtC2VrZpZmjX3NktcOJt0Ocz54U3GR2WkDHI9bwYHQXt0Izn+w7qvz+Z4GNEgVLPXGwBkeRSWDorPG9Fhi15ht2C6xH32Zp+VYbobsOR35Qaci6j7ohmpVv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usi8u7sy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609AEC19424;
	Tue, 24 Mar 2026 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774370428;
	bh=kkEoPq9q8fepKtiANcT9ZAfQh5CvujgTy1fMX5zG1GA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Usi8u7syiR8pttrP0If0eBSXVLvECDh4vy08/ZqtVulKRKflVXL3jmVRdohQwKBht
	 pLikhuBCMExn+lDeH6gZOvhrGD5M3hP1lqIHYnzAv8h1HHMojvzMXa5gzawCKPOY1a
	 eP2VC+2G4tfe7JyybigsnG7eTh9RsPeaM7wV6B6BIzFU2+inKczujBFLdhXFfoL2gy
	 rnYVj0DfIip6b1NXGbxPHADZRGyVLbrPc/NrqMJg5deMxaIldA39qLx9J4yPIPZhJg
	 NwmSSN+0BLFj8KbsFRSmClIbvc/QpUY5ipHQ42eIbrqKFyhJUeWnbIgZ1F+xDLL6Rg
	 GW4STqjEN8Cng==
Date: Tue, 24 Mar 2026 16:40:23 +0000
From: Lee Jones <lee@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, dri-devel@lists.freedesktop.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1] backlight: apple_bl: Convert to a platform driver
Message-ID: <20260324164023.GE2902881@google.com>
References: <5084777.GXAFRqVoOG@rafael.j.wysocki>
 <acEOf2pI_NpfA4EP@aspen.lan>
 <CAJZ5v0itCrbwM2k4_3F0kQwTfAwKXFQ5G4gcn=bM65Y2NU9YjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0itCrbwM2k4_3F0kQwTfAwKXFQ5G4gcn=bM65Y2NU9YjQ@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6708-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lists.freedesktop.org,vger.kernel.org,gmail.com,gmx.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: BBB2A319582
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Mar 2026, Rafael J. Wysocki wrote:

> On Mon, Mar 23, 2026 at 10:57 AM Daniel Thompson <danielt@kernel.org> wrote:
> >
> > On Sat, Mar 14, 2026 at 12:50:11PM +0100, Rafael J. Wysocki wrote:
> > > From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> > >
> > > In all cases in which a struct acpi_driver is used for binding a driver
> > > to an ACPI device object, a corresponding platform device is created by
> > > the ACPI core and that device is regarded as a proper representation of
> > > underlying hardware.  Accordingly, a struct platform_driver should be
> > > used by driver code to bind to that device.  There are multiple reasons
> > > why drivers should not bind directly to ACPI device objects [1].
> > >
> > > Overall, it is better to bind drivers to platform devices than to their
> > > ACPI companions, so convert the Apple Backlight ACPI driver to a
> > > platform one.
> > >
> > > While this is not expected to alter functionality, it changes sysfs
> > > layout and so it will be visible to user space.
> > >
> > > Link: https://lore.kernel.org/all/2396510.ElGaqSPkdT@rafael.j.wysocki/ [1]
> > > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> 
> Thanks!
> 
> Unless anyone has any objections or concerns (in which case please let
> me know), I'm going to queue up this one for 7.1.

Why would you queue-up a Backlight patch?

I'd rather this goes in via the Backlight tree.

-- 
Lee Jones [李琼斯]

