Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D25B1B3A19
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Apr 2020 10:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgDVIaj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Apr 2020 04:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726041AbgDVIaj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Apr 2020 04:30:39 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33939C03C1A6
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Apr 2020 01:30:39 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id x17so576733wrt.5
        for <linux-fbdev@vger.kernel.org>; Wed, 22 Apr 2020 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N198uR7DHjzE6ifgeJ0vSDotBvsASzMwI3aPwyINxz8=;
        b=OOdahWIVeJP86hKdDj+G+A4SUywqZHOA9g2/p2WSYlkN/b3XF/jhbWsKiAo8q5cuI3
         a9Tuo5VujiToojBzvN6J2ib1eZyZc7RhxrkwygQ3WdAHKksC5twnENsK3+j4HOAEmFdf
         KkduORTEnAXCmHj717psnhxt/iRMMkuRAf/is4BXVzzW38BF24/NDAhK++JE0GNnwQgl
         gjDB3bp+aUbmkSgTdUZg8eVHe86xt4NdwbMzX8zDiyAaAskV5InUIPVVCIlSXx5xDaxS
         Bf0NCpWD4FaKvMY8bXyR7Ptr2k9PVADSXEXHdmQUV8VYtHJoumLwgXzH1ZJPS1PLUiHZ
         3DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N198uR7DHjzE6ifgeJ0vSDotBvsASzMwI3aPwyINxz8=;
        b=r3VPYeYcLNYjxxM515J0b0oydzaVVaCgP/W8JB8b/rDHyhLFzqiGbKCLi+tvVpZUaM
         eHVc4cGoJZzCwaCrWswBp3KemQbbBQUEhz9PsXmig+euzuJroUUoBRYcUBMdIhUpyFLe
         JL+97BRx5rtDHwstjiTfY04XYQLtVed/IXwDXK75JJzsIGcPqAcwUKM7bwXUONvVzMV+
         GoNeoACKtt+TUsU1kv7NC8xaRzmLfnWUQSUVl7eA0A8Pq99W7KSVWqMPUOdIMvsYoaEC
         FHna1jfDfEY7x5ATFV1xW4VH1QVsBI4r6QdpkmI2HGK4DufeEBDNZ/X1FsUSAOxy+4PG
         ei/w==
X-Gm-Message-State: AGi0PubHJEbSKh507RQ7k4rikJj/ql0oxxN3pewg8W1K0QIzMaADQoQT
        a4YzuhxczyxmukO+/rfjfmGi2Q==
X-Google-Smtp-Source: APiQypJGdzse3wJsfuMTdqC+mxzZ6VnuBuO5qZKa8jUH1hHazlsfCuwyDvd2tOAPfdYzma2kYhOO3w==
X-Received: by 2002:adf:9564:: with SMTP id 91mr29278554wrs.246.1587544237873;
        Wed, 22 Apr 2020 01:30:37 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id 36sm7374394wrc.35.2020.04.22.01.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 01:30:37 -0700 (PDT)
Date:   Wed, 22 Apr 2020 09:30:35 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCHv3 4/4] backlight: led_bl: fix led -> backlight brightness
 mapping
Message-ID: <20200422083035.wiujphrt5k7o244v@holly.lan>
References: <20200422065114.22164-1-tomi.valkeinen@ti.com>
 <20200422065114.22164-5-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422065114.22164-5-tomi.valkeinen@ti.com>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, Apr 22, 2020 at 09:51:14AM +0300, Tomi Valkeinen wrote:
> The code that maps the LED default brightness to backlight levels has
> two issues: 1) if the default brightness is the first backlight level
> (usually 0), the code fails to find it, and 2) when the code fails to
> find a backlight level, it ends up using max_brightness + 1 as the
> default brightness.
> 
> Fix these two issues.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
