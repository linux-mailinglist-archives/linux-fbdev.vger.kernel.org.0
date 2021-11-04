Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E25E44515A
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Nov 2021 10:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhKDJzo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 4 Nov 2021 05:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbhKDJzo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 4 Nov 2021 05:55:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6DEC061714
        for <linux-fbdev@vger.kernel.org>; Thu,  4 Nov 2021 02:53:06 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l3so3381982pfu.13
        for <linux-fbdev@vger.kernel.org>; Thu, 04 Nov 2021 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=YTepTj8Gq3St/YWYKZ3iB/e5/FCMY7Ja0J0Bqi3kt8Q=;
        b=ba0b5bIDz/cN0+zRf+VATyXmuQIGjwesW3Fcf5HXzoRMJ05aW1DsjZvZxzYtvrCFb/
         /ZIvBA8MR+9J/VaDBYwD1IRoPMMps1zt6/K1Sx/pQmRVszntEbIudkeirA4UybD+jPAu
         CAIq5OiFBZ7W4R9bhQkQiddZeerOFqvLmPwYItlLZ+70NVpBe2HJuFBXLE//+YourB9C
         bj7TCsXMMUjj8KOmPoKWTfhevqxeskw+uoCpV+pIZE7pbnsq5ghXNPfUI2YK9YY70v2J
         W5FrXxlVrHLtu4Ug/qoZVcstrRqBW4rccw0JL94Yo1KBUJt/Za97yt9HRB6WD3CLVbp0
         6Egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=YTepTj8Gq3St/YWYKZ3iB/e5/FCMY7Ja0J0Bqi3kt8Q=;
        b=QFwqoakimyhJRvk1faPAalqC+C0rnEqXJF0EN/RM95Rdqpl7pzU5YYDyZ8/DLmYoDX
         Y/yKFPJl0iiOv4n3ghPS1VTZ0n+xU/ID8PVxHFC7p7PJajSAtcsiCVMPp18kCOhMUbeD
         M6X4IkVlJpO/79oO5K4f1hJKhkO+yWkf2YOX6IRQNi7jn0sDO4voTH7sQFOJkiZhZCYZ
         Ap6mZBfngZ+Er0OqWmFEAqjMjSHTZPoWcW2nsez+ZErKRYO46Y7q2/1AFM+IwoDULkw7
         3l8wLPmlok+GG9KrB6gBG8XZG5KNSobguC5Pn6b7BHAzjP6t7pmCFE+AULFKjR/AgFyY
         JMbQ==
X-Gm-Message-State: AOAM530U+SfCWxSMrI+abctw2zdmXskO4HvJgVen0Tu2r3bwlEGRgp7g
        CXeghHBjKU7NpbDVJnk1NH702b/zUenc+Xy7u1w=
X-Google-Smtp-Source: ABdhPJwjaHV8++cvvMlOMxBAlhN0chGOTaHOFNu/Xw8zADKP+R/twEwnxnyVYXB47mD1x+cnH3O8N5yS0RmakQCDVpw=
X-Received: by 2002:a65:6792:: with SMTP id e18mr21481066pgr.318.1636019586502;
 Thu, 04 Nov 2021 02:53:06 -0700 (PDT)
MIME-Version: 1.0
Sender: koudjuotengue@gmail.com
Received: by 2002:a05:6a20:3d95:b0:5d:366f:ff9a with HTTP; Thu, 4 Nov 2021
 02:53:06 -0700 (PDT)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Thu, 4 Nov 2021 09:53:06 +0000
X-Google-Sender-Auth: lHXZRMSPPEZDwvdGGwATZ5pDZq4
Message-ID: <CAMMuEMLA84Y=NU8jguVq2eE9XJd7mmON4SCb5KY+P9SjFyKwtA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Salut, as-tu re=C3=A7u mes deux pr=C3=A9c=C3=A9dents e-mails ? merci de v=
=C3=A9rifier et
de me r=C3=A9pondre.

Hallo, heb je mijn twee vorige e-mails ontvangen? controleer en antwoord mi=
j.
