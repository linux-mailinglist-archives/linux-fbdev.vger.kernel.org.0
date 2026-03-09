Return-Path: <linux-fbdev+bounces-6514-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEuUGbOdrmk7GwIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6514-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 11:15:15 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF1236DBB
	for <lists+linux-fbdev@lfdr.de>; Mon, 09 Mar 2026 11:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D45E43038FC3
	for <lists+linux-fbdev@lfdr.de>; Mon,  9 Mar 2026 10:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5B238B7C6;
	Mon,  9 Mar 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="EB0oeVK1"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A34838B7D7
	for <linux-fbdev@vger.kernel.org>; Mon,  9 Mar 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050791; cv=none; b=ivXaBe1BBcZbYGRY2zr460Il0U8BrHclHLaRzKjFoCIoCwWjdjb6zAKSqHHb66FwDg9BGq/yH8xNKO1DF6FBH3c3xfyyOiVwndaIMD9/9TmCM9FYuEMWzV4TYZCCu493pL+h3mP+vYCuNAWvbSecAh2eudF6pohzCpxRBPCcYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050791; c=relaxed/simple;
	bh=uQ2kDxpdlDDv6iF7b7NG15zLxeKxpKXzs8NjvMYST8E=;
	h=Message-Id:From:To:Date:Subject:Cc:Mime-Version; b=m7y6609dpysuMKEC4nK8lUd85Ec8647BJDbWMbqmaIz3qkMYGcvix0X5HnxiUJIbNjQJdJADVbLCvXmtXrwEOfZ45XJVJsgeMDNAsIFu6ApHqluVRR4FQJAsmgnAJLpX6IBv/wHVLZhaJG0lI/WjXg5jWHyNWpSxpR4yYpDPSd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=EB0oeVK1; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=eAxF+/AcK7m302S1o8AvFUXytSDJKZCmIk/jMtwP/gc=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=EB0oeVK1xK5vXL3NGzmeR/liZp+QveMc2j9O2fv30gdE3GgFTjA7pRx0jCYfXK2Rx87I+9XfT0GR
        YkTdrYLYS34lXZALgFah4rCJEnl8dw+hAd3tdmf+ifTaSt3xqaWcl8pP01Mj3t141RdZSf8KwIe3
        CkQWpTPsz6dD6i/rjEhcbjt+/fpVvXpDViqOysasOE2B5u5gzfl8yMBFUZEc9VrQr5Ko2FFh0vqj
        humvUm81WPWktlLa3TK2H0DVqjePBDNvZyNiIiZtA+Z83pOVb4n9kdJxyVXY/dIeBhmijZxX8s3r
        zsZLlKILK50RMsuctasm2EWlDjwfGjpq/UDEWg==
Message-Id: <6c69b40d-48d3-49fb-beee-ab02e8060882@smtp-relay.sendinblue.com>
Origin-messageId: <20260309100609.278677-1-me@dipeshchaudhary.in>
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZ348MjAyNjAzMDkxMDA2MDkuMjc4Njc3LTEtbWVAZGlwZXNoY2hhdWRoYXJ5LmluPn5nei5kLnNlbmRlci1zaWIuY29t
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
X-CSA-Complaints: csa-complaints@eco.de
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 10:06:09 +0000
Subject: Re: [PATCH] staging: sm750fb: constify g_fbmode array
X-sib-id: 1_mLrp7Ne9UevUUj3SRsXecg-Fge4YLIr2q0pWD_ZQtSMYx4kDAimBJQa3tBcAAe4G-uE4J-4eLJX63_GvZG4bijP8xN0Zmd03zD6DKGnbO77_s8QdpPHb2CD4QovWH9cWPVJXZOACtjkEEhFcBSfaMco_2Pg091C23cG8cW-F_b6hWhmej9CpqK
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.47.3
Cc: <sudipm.mukherjee@gmail.com>, <teddy.wang@siliconmotion.com>, <linux-fbdev@vger.kernel.org>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Rspamd-Queue-Id: C3DF1236DBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[dipeshchaudhary.in : SPF not aligned (strict),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	FAKE_REPLY(1.00)[];
	R_DKIM_REJECT(1.00)[dipeshchaudhary.in:s=brevo1];
	MV_CASE(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	TAGGED_FROM(0.00)[bounces-6514-lists,linux-fbdev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,siliconmotion.com,vger.kernel.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,smtp-relay.sendinblue.com:mid];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-0.758];
	FROM_NEQ_ENVFROM(0.00)[me@dipeshchaudhary.in,linux-fbdev@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[dipeshchaudhary.in:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG]
X-Rspamd-Action: no action


Hi Greg,

On Mon, Mar 09, 2026 at 09:49:57AM +0000, dipesh chaudhary wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
> -VERSION =3D 6
> -PATCHLEVEL =3D 19
> +VERSION =3D 7
> +PATCHLEVEL =3D 0
>  SUBLEVEL =3D 0
> -EXTRAVERSION =3D
> +EXTRAVERSION =3D -rc1

> Why have you changed the Makefile?

I sincerely apologize for that. This is my very first kernel patch, and I w=
as experimenting with the Makefile earlier on my local machine. I accidenta=
lly staged and included it in my commit alongside the driver fix without re=
alizing it.

> And did you test-build your change?

To be completely honest, no. I only ran `checkpatch.pl` to verify the warni=
ng was resolved.=20

I will clean up my Git tree, figure out how to test-build the specific sm75=
0 module locally, and then submit a clean v2 patch. Thank you for your pati=
ence with a beginner.

Best regards,
Dipesh Chaudhary



