Return-Path: <linux-fbdev+bounces-1845-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB92898C70
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Apr 2024 18:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A9521C21465
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Apr 2024 16:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC92E1C6BE;
	Thu,  4 Apr 2024 16:44:23 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F61BDCD
	for <linux-fbdev@vger.kernel.org>; Thu,  4 Apr 2024 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712249063; cv=none; b=aDWUdtRVtMSMTmJw1EdgXOrMwPTDvwC+luzQv0zgSJii65WqR1QZ3aDdSRiSt24gf7CrhOSvTU9Dgyb6ggUjeJyQbWXzx3um6K8PoAPbhZZ/sMbpvDhC7LmGMfN0dgRTng13v6yn4wlbQytAB1KJpQ1yXbvDnRR0GynGhEWFgak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712249063; c=relaxed/simple;
	bh=TZIfQPgqs7Z3WF96QK1RbB8zUhL/7+50O2ZLuWcegkE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LxN13+T5tW1kQNpdu0Z4hXKXKwqNIe/XPS4WpuNWu5WAbfg7tgutFdMeWlxuWT15aYS7fw8aCT/NKyCfDwoDjsaDpHZkE04PLuPhV2fFvrLlwWky+NPGkQqHP5R6WL+QUoU6noEiCzYhTRYligEW/pC8Z7ZN6MCLEdePTN/NqgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rsQCI-0000iB-KZ; Thu, 04 Apr 2024 18:44:18 +0200
Message-ID: <6ae0c57c2176364c8001397d647f9d9fb792fba7.camel@pengutronix.de>
Subject: Re: [PATCH] drivers: video: logo: Don't mention the full path of
 the input in output
From: Lucas Stach <l.stach@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Thu, 04 Apr 2024 18:44:17 +0200
In-Reply-To: <c3108939-9e6f-489d-9954-82bd6c2dd3b0@gmx.de>
References: <20240404121824.3330254-1-l.stach@pengutronix.de>
	 <c3108939-9e6f-489d-9954-82bd6c2dd3b0@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-fbdev@vger.kernel.org

Am Donnerstag, dem 04.04.2024 um 15:15 +0200 schrieb Helge Deller:
> On 4/4/24 14:18, Lucas Stach wrote:
> > This change strips $abs_srctree of the input file containing the
> > PNM data in the generated output. The motivation for this change
> > is Yocto emitting a build warning
> >=20
> >      WARNING: linux-foo-6.8-r0 do_package_qa: QA Issue:
> >      File /usr/src/debug/linux-foo/6.8-r0/drivers/video/logo/logo_linux=
_clut224.c
> >      in package linux-foo-src contains reference to TMPDIR
> >=20
> > So this change brings us one step closer to make the build result
> > reproducible independent of the build path.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >   drivers/video/logo/pnmtologo.c | 14 +++++++++++++-
> >   1 file changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtol=
ogo.c
> > index 2434a25afb64..59ccd721e8af 100644
> > --- a/drivers/video/logo/pnmtologo.c
> > +++ b/drivers/video/logo/pnmtologo.c
> > @@ -223,6 +223,18 @@ static inline int is_equal(struct color c1, struct=
 color c2)
> >=20
> >   static void write_header(void)
> >   {
> > +	const char *abs_srctree =3D getenv("abs_srctree");
> > +	const char *rel_filename;
> > +
> > +	if (abs_srctree &&
> > +	    !strncmp(abs_srctree, filename, strlen(abs_srctree))) {
> > +		rel_filename =3D filename + strlen(abs_srctree);
> > +		while (*rel_filename =3D=3D '/')
> > +			++rel_filename;
> > +	} else {
> > +		rel_filename =3D filename;
> > +	}
> > +
> >   	/* open logo file */
> >   	if (outputname) {
> >   		out =3D fopen(outputname, "w");
> > @@ -235,7 +247,7 @@ static void write_header(void)
> >   	fputs("/*\n", out);
> >   	fputs(" *  DO NOT EDIT THIS FILE!\n", out);
> >   	fputs(" *\n", out);
> > -	fprintf(out, " *  It was automatically generated from %s\n", filename=
);
> > +	fprintf(out, " *  It was automatically generated from %s\n", rel_file=
name);
>=20
> can't you use instead: ?
> > +	fprintf(out, " *  It was automatically generated from %s\n", basename=
(filename));
>=20
The difference to basename is that this keeps the path in the source
tree intact, e.g. it shortens the absolute path to
"drivers/video/logo/logo_linux_clut224.c", so the comment in the
generated file still has a full reference to the file location in the
source tree. It only strips out the part of the path that is host
dependent.

Regards,
Lucas

> Helge
>=20
>=20
> >   	fputs(" *\n", out);
> >   	fprintf(out, " *  Linux logo %s\n", logoname);
> >   	fputs(" */\n\n", out);
>=20


