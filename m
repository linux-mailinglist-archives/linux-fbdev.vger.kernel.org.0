Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5791492564
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 13:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239430AbiARMIN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 07:08:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46674 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239328AbiARMIL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 07:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642507691;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mTJ9EtX5N2EhF9Fqj6aj3AMNHvKTNUztMryd3miPWg0=;
        b=ACFuaVr7qQIuo3UBSE+hwgkdsDDcS73XmSo9qGkmOlor1suU5kNyARgFW1eExDt75WfBVN
        fhV+SYTAkWTEDYNRAnGU3X+24QNi1rtUlr7xbS/aIj6SbmZHBHom/vIcb2I3AIMjsObaqQ
        zd/QQX8fkeiAXsb3TP544blvD2k5EZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-xzNf8PU0MQ2T7-v6zwQeDg-1; Tue, 18 Jan 2022 07:08:08 -0500
X-MC-Unique: xzNf8PU0MQ2T7-v6zwQeDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69E781030C22;
        Tue, 18 Jan 2022 12:08:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 21B2F105916D;
        Tue, 18 Jan 2022 12:08:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 2815418000A6; Tue, 18 Jan 2022 13:07:59 +0100 (CET)
Date:   Tue, 18 Jan 2022 13:07:59 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Pekka Paalanen <ppaalanen@gmail.com>, linux-fbdev@vger.kernel.org,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118120759.qobqonhonej3vnqw@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
 <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAKMK7uGQ=pGHv+LcRxZqb_jV0fqzUZtd+tZCr7aatoMDF4hyvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uGQ=pGHv+LcRxZqb_jV0fqzUZtd+tZCr7aatoMDF4hyvw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

  Hi,

> > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > doing it synchronously.
> 
> Yeah, and if you use the shadow fb support in drm fbdev helpers,
> that's what you get. Maybe we should just make that the default, since
> that would also greatly simply stuff like modesetting support for
> fbdev.

Yep, that helps of course.  I was thinking more about the chars + attrs
+ font -> framebuffer step in the fbcon rendering pipeline though where
one could do something simliar to save even more cpu cycles.

take care,
  Gerd

